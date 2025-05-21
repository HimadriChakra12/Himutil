Write-host "Adding Scoop...." -foreground yellow
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
Write-host "Done Adding" -foreground green


