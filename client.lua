local isOpen = false 
local disabled = false
local active = true

RegisterCommand('watermark', function()
  if Config.toggle then
    if Config.logo then
      if not isOpen then
        TriggerEvent('DisplayWM', true)
      else
        TriggerEvent('DisplayWM', false) 
      end
    else
      if active then
        active = false
      else
        active = true
      end
    end
  end
end)

function RGBRainbow(frequency)
  local result = {}
  local curtime = GetGameTimer() / 1000

  result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
  result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
  result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

  return result
end

Citizen.CreateThread(function()
  if NetworkIsSessionStarted() then
    TriggerEvent("chat:addSuggestion", "/watermark", "Toggle the watermark")
    return
  end
end)

if Config.logo then
  AddEventHandler('onClientMapStart', function ()
    Citizen.CreateThread(function ()
      isOpen = true
      TriggerEvent('DisplayWM', true) 
    end)
  end)
  
  RegisterNetEvent('DisplayWM', function (status)
    if status then 
      SendNUIMessage({displayWindow = 'true'})
      isOpen = true
      disabled = false
    else
      SendNUIMessage({displayWindow = 'false'})
      isOpen = false
      disabled = true
    end
  end)
else
  local text = Config.text
  local textColour = Config.textColour
  local textTransparency = Config.textTransparency
  local textFont = Config.textFont
  local textScale = Config.textScale
  local textOffset = Config.textOffset

  Citizen.CreateThread(function()
    while true do
      Wait(1)
      if active then
        if Config.textRainbow then
          textColour = RGBRainbow(1)
        end
        SetTextColour(textColour.r, textColour.g, textColour.b, textTransparency)
        SetTextFont(textFont)
        SetTextScale(textScale, textScale)
        SetTextWrap(0.0, 1.0)
        SetTextCentre(false)
        SetTextDropshadow(2, 2, 0, 0, 0)
        SetTextEdge(1, 0, 0, 0, 205)
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(textOffset.x, textOffset.y)
      end
    end
  end)
end
