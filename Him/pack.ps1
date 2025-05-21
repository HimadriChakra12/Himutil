set-alias readh read-host
set-alias writeh write-host
set-alias startp start-process
writeh "  
1. Chocolatey
2. Scoop            
3. Winget
"
    Set-ExecutionPolicy -ExecutionPolicy remotesigned
$choicectt = readh "Choose"
switch ($choicectt){
    1{
        iwr -useb "https://community.chocolatey.org/install.ps1" | iex
    }
    2{
        startp powershell -ArgumentList '-noexit -NoProfile -ExecutionPolicy Bypass -Command "irm -Uri https://get.scoop.sh | iex"'  
    }
    3{
        startp powershell -ArgumentList '-noexit -NoProfile -ExecutionPolicy Bypass -Command "wsreset -i; exit"' -wait
            while ($true) {
                $store = Get-AppxPackage -Name "Microsoft.WindowsStore" -ErrorAction SilentlyContinue
                    if ($store) {
                        Write-Host "Microsoft Store is installed."
                            msg * "Microsoft Store is installed."
                            [console]::beep(1000, 300)
                            start-process "https://apps.microsoft.com/detail/9nblggh4nns1?hl=en-US&gl=US"
                                break
                    } else {
                        Write-Host "Microsoft Store not found. Retrying in 5 seconds..."
                            msg * "Microsoft Store is not installed. Retrying in 5 seconds..."
                            Start-Sleep -Seconds 5
                    }
            }   
    }
}
