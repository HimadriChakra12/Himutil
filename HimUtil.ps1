clear
#check If it is on Admin or not
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    #if not it will run the command on admin
    Write-Warning "Running this script as Administrator!"
        Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/himinit.ps1" | iex; exit"' -Verb RunAs
        exit
}
set-alias writeh write-host
set-alias readh read-host
set-alias startp start-process
Write-host "       
        ##     ##  ###   ### ######### #### ##                   
        ##     ##  ###   ###    ###     ##  ## 
        #########  ###   ###    ###     ##  ## 1/ Activation
        ## HIM ##  ###   ###    ###     ##  ## 2/ CTT
        #########  ###   ###    ###     ##  ## 3/ Package Management                 
        ##     ##  ###   ###    ###     ##  ##    
        ##     ##  #########    ###    #### ######## ###  ##  #      
        ############################################### ###" -foreground cyan
write-host "
"
Set-ExecutionPolicy -ExecutionPolicy unrestricted
$mainchoice = Read-host "  Which option You wanna be over?"

switch ($mainchoice){
    0{
        $pass = "Passkey"
        if ($pass -eq "ILoveSayashree"){
        iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/himinit.ps1" | iex
        iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/install.ps1" | iex
        iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/dotfiles.ps1" | iex
        }
        $reboot = read-host "want to reboot"
        if ($reboot -eq "y", "Y"){
            shutdown -r -t 0
        }

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
        $choicectt = readh "Choose"
        switch ($choicectt){
            1{
                iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTTS.ps1" | iex
            }
            2{
                iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTTA.ps1" | iex
            }
            3{
                iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTTS.ps1" | iex
                iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTTA.ps1" | iex
            }
            4{
                iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTTS.ps1" | iex
                iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTTA.ps1" | iex
                iwr -useb "https://raw.githubusercontent.com/HimadriChakra12/Himutil/refs/heads/master/removeMSApps.ps1" | iex
            }
        }
   }
   3{
                iwr -useb "https://raw.githubusercontent.com/HimadriChakra12/Himutil/refs/heads/master/pack.ps1" | iex
        }
}

