clear
#check If it is on Admin or not
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    #if not it will run the command on admin
    Write-Warning "Running this script as Administrator!"
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "iwr -useb "https://tinyurl.com/hutility" | iex ; exit "' -Verb RunAs
    exit
}
Write-host "
+----------------------------------------------------------------+
|                                                                |
|       ##     ##  ###   ### ######### #### ##                   |
|       ##     ##  ###   ###    ###     ##  ##                   |
|       #########  ###   ###    ###     ##  ##                   |
|       ## HIM ##  ###   ###    ###     ##  ##                   |
|       #########  ###   ###    ###     ##  ##                   |
|       ##     ##  ###   ###    ###     ##  ##                   |
|       ##     ##  #########    ###    #### ######## ##          |
|       ###############################################          |
|                                                                |
|       1/ Activation                                            |
|       2/ CTT                                                   |
|       3/ Package Management                                    |
|                                                                |
+----------------------------------------------------------------+
" -foreground cyan
write-host "
"
Write-host "Turning Off Windows Security"
iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/Him/nosecq.ps1" | iex
iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/Him/edgedefault.ps1" | iex
$mainchoice = Read-host "Which option You wanna be over?"

switch ($mainchoice){
    0{
        iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/Him/himinit.ps1" | iex
        $reboot = read-host "want to reboot"
            if ($reboot -eq "y", "Y"){
                shutdown -r -t 0
            }
    }
    1{irm "https://get.activated.win" | iex}
    2{write-host "  
            1. CTT Standard Tweaks
            2. CTT Advanced Tweaks
            3. 1 & 2
            4. 3 with MSapps Removal
        "
        $choicectt = read-host "Choose"
        switch ($choicectt){
             1{iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTT/CTTS.ps1" | iex}
             2{iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTT/CTTA.ps1" | iex}
             3{
               iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTT/CTTS.ps1" | iex
               iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTT/CTTA.ps1" | iex
             }
             4{
               iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTT/CTTS.ps1" | iex
               iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTT/CTTA.ps1" | iex
               iwr -useb "https://raw.githubusercontent.com/HimadriChakra12/Himutil/refs/heads/master/CTT/removeMSApps.ps1" | iex
             }
        }
   }
   3{iwr -useb "https://raw.githubusercontent.com/HimadriChakra12/Himutil/refs/heads/master/Him/pack.ps1" | iex}
   4{exit}
}
$secu = read-host "Want to turn on Windows Security?[y/Y(recovery)/n]" -foreground cyan
switch ($react){
    y{
        Set-MpPreference -DisableRealtimeMonitoring $false
        Set-MpPreference -DisableBehaviorMonitoring $false
        Set-MpPreference -DisableBlockAtFirstSeen $false
        Set-MpPreference -DisableIOAVProtection $false
        Set-MpPreference -DisableScriptScanning $false
    }
    Y{
        Set-MpPreference -DisableRealtimeMonitoring $false
        Set-MpPreference -DisableBehaviorMonitoring $false
        Set-MpPreference -DisableBlockAtFirstSeen $false
        Set-MpPreference -DisableIOAVProtection $false
        Set-MpPreference -DisableScriptScanning $false
        Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -ErrorAction SilentlyContinue
    }
    N{
        exit
    }
    n{
        exit
    }
}

