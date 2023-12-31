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

fx_version "cerulean"
game "gta5"

name "Krypt_Watermark"
description "Customisable Watermark"
author "Krypt Scripts"
version "v1.1.0"
lua54 'yes'

shared_script 'settings.lua'

client_scripts {
	'scripts/client/*'
}

ui_page 'html/ui.html'

files {
	'html/*',
	'html/img/*'
}

escrow_ignore {
	'settings.lua',
	'client.lua'
}