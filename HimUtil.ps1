clear
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Running this script as Administrator!"
        Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "iwr -useb "https://tinyurl.com/himutil" | iex"' -Verb RunAs
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
        #Activation
        iwr -useb "https://tinyurl.com/himact" | iex
        #christitustool
        iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTTS.ps1" | iex
        iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTTA.ps1" | iex
        iwr -useb "https://raw.githubusercontent.com/HimadriChakra12/Himutil/refs/heads/master/removeMSApps.ps1" | iex
        #packagemanagement
            Set-ExecutionPolicy -ExecutionPolicy remotesigned
            #chocolatey
            iwr -useb "https://community.chocolatey.org/install.ps1" | iex
            #scoop
            startp powershell -ArgumentList '-noexit -NoProfile -ExecutionPolicy Bypass -Command "irm -Uri https://get.scoop.sh | iex"'  
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

