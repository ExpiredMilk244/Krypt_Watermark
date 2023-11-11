--[[
$$\   $$\                                $$\     
$$ | $$  |                               $$ |    
$$ |$$  /  $$$$$$\  $$\   $$\  $$$$$$\ $$$$$$\   
$$$$$  /  $$  __$$\ $$ |  $$ |$$  __$$\\_$$  _|  
$$  $$<   $$ |  \__|$$ |  $$ |$$ /  $$ | $$ |    
$$ |\$$\  $$ |      $$ |  $$ |$$ |  $$ | $$ |$$\ 
$$ | \$$\ $$ |      \$$$$$$$ |$$$$$$$  | \$$$$  |
\__|  \__|\__|       \____$$ |$$  ____/   \____/ 
                    $$\   $$ |$$ |               
                    \$$$$$$  |$$ |               
                     \______/ \__|               

 $$$$$$\                      $$\            $$\               
$$  __$$\                     \__|           $$ |              
$$ /  \__| $$$$$$$\  $$$$$$\  $$\  $$$$$$\ $$$$$$\    $$$$$$$\ 
\$$$$$$\  $$  _____|$$  __$$\ $$ |$$  __$$\\_$$  _|  $$  _____|
 \____$$\ $$ /      $$ |  \__|$$ |$$ /  $$ | $$ |    \$$$$$$\  
$$\   $$ |$$ |      $$ |      $$ |$$ |  $$ | $$ |$$\  \____$$\ 
\$$$$$$  |\$$$$$$$\ $$ |      $$ |$$$$$$$  | \$$$$  |$$$$$$$  |
 \______/  \_______|\__|      \__|$$  ____/   \____/ \_______/ 
                                  $$ |                         
                                  $$ |                         
                                  \__|                         

Thank you for downloading.
For support, view the documentation or join our discord.

Discord: https://discord.gg/ZwFX57r2K7
Documentation: https://krypt-scripts.gitbook.io/krypt-scripts/
]]--

local isOpen = false 
local disabled = false
local active = true

function RGBRainbow(frequency)
  local result = {}
  local curtime = GetGameTimer() / 1000

  result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
  result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
  result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

  return result
end

if Settings.toggle then
  RegisterCommand('watermark', function()
    if Settings.logo then
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
  end)

  Citizen.CreateThread(function()
    if NetworkIsSessionStarted() then
      TriggerEvent("chat:addSuggestion", "/watermark", "Toggle the watermark")
      return
    end
  end)
end

if Settings.logo then
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

  AddEventHandler('onResourceStart', function()
    Wait(200)
    TriggerEvent('DisplayWM', true)
  end)

  AddEventHandler('onClientMapStart', function ()
    Wait(200)
    TriggerEvent('DisplayWM', true) 
  end)
else
  local text = Settings.text
  local textColour = Settings.textColour
  local textTransparency = Settings.textTransparency
  local textFont = Settings.textFont
  local textScale = Settings.textScale
  local textOffset = Settings.textOffset

  Citizen.CreateThread(function()
    while true do
      Wait(1)
      if active then
        if Settings.textRainbow then
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
