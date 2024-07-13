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

local active = true

local function RGBRainbow(frequency)
  local result = {}
  local curtime = GetGameTimer() / 1000

  result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
  result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
  result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

  return result
end

local function Main()
    if Settings.toggle then
        RegisterCommand('watermark', function()
            if Settings.logo then
              if not active then
                TriggerEvent('krypt_watermark:client:toggleWatermark', true)
              else
                TriggerEvent('krypt_watermark:client:toggleWatermark', false) 
              end
            else
              if active then
                active = false
              else
                active = true
              end
            end
        end)

        TriggerEvent("chat:addSuggestion", "/watermark", "Shows/hides watermark")
    end

    if Settings.logo then
        RegisterNetEvent('krypt_watermark:client:toggleWatermark', function(status)
            if Settings.logo then
                if status then
                    SendNUIMessage({toggleImage = 'true'})
                    active = true
                else
                    SendNUIMessage({toggleImage = 'false'})
                    active = false
                end
            end
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
        end)
    end
end

Main()
