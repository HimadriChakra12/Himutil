clear
set-alias writeh write-host
set-alias readh read-host
Write-host "       
          ##     ## ######  ####       ##### ####    #### ########### ####### ####                    
         ##     ##   ###   #####     ###### ####    ####     ####      ###   ####  1/ Activation
        #########   ###   ### ###  ### ### ####    ####     ####      ###   ####  2/ CTT
       ## HIM ##   ###   ###  ### ### ### ####    ####     ####      ###   ####  3/ Package Management
      #########   ###   ###    ####  ### ####    ####     ####      ###   ####                  
     ##     ##   ###   ###          ### ####    ####     ####      ###   ###############  # ####  ##    
    ##     ## ####### ###          ### ############     ####    ####### ############### ###  ##  #      
   ######################################################################################### ###" -foreground green
write-host "

"

$mainchoice = Read-host "  Which option You wanna be over?"

switch ($mainchoice){
    0{
        
    }
    1{
        iwr -useb "https://tinyurl.com/himact" | iex
    }
    2{
        writeh "  
      1. CTT Standard Tweaks
      2. CTT Advanced Tweaks
      3. 1 & 2
      4. 3 with MSapps Removal
        "
    }
}

