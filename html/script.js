/*
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
*/

window.addEventListener('message', function(x) {
	$("#image").stop(false, true);
    if (x.data.toggleImage == 'true') {
        $("#image").css('display', 'flex');

        $("#image").animate({
        	bottom: "25%",
        	opacity: "1.0"
        	},
        	700, function() {

        });
    } else {
    	$("#image").animate({
        	bottom: "-50%",
        	opacity: "0.0"
        	},
        	700, function() {
        		$("#image").css('display', 'none');
	         	
        });
    }
});
