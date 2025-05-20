
        #Activation
        iwr -useb "https://tinyurl.com/himact" | iex
        #christitustool
        iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTTS.ps1" | iex
        iwr -useb "https://github.com/HimadriChakra12/Himutil/raw/refs/heads/master/CTTA.ps1" | iex
        iwr -useb "https://raw.githubusercontent.com/HimadriChakra12/Himutil/refs/heads/master/removeMSApps.ps1" | iex
        #packagemanagement
            Set-ExecutionPolicy -ExecutionPolicy remotesigned -ErrorAction SilentlyContinue
            #chocolatey
            iwr -useb "https://community.chocolatey.org/install.ps1" | iex
            #scoop
            startp powershell -ArgumentList '-noexit -NoProfile -ExecutionPolicy Bypass -Command "irm -Uri https://get.scoop.sh | iex"'  
            #Winget
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
                            Start-Sleep -Seconds 5
                    }
            }   
