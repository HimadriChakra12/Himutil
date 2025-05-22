Write-host "Adding Scoop...." -foreground yellow
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
Write-host "Done Adding" -foreground green


