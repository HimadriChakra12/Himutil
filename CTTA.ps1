Write-host "Setting up Display for Performance...."
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](144,18,3,128,16,0,0,0))

Write-host "Disabling Copilot...."
dism /online /remove-package /package-name:Microsoft.Windows.Copilot
