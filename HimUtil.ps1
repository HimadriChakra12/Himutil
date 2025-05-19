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
    1{:q

    2{
        write-host "  
      1. CTT Standard Tweaks
      2. CTT Advanced Tweaks
      3. 1 & 2
      4. 3 with MSapps Removal
        "
    }
}

