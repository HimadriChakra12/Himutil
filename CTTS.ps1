Write-host "Disabling pwsh7 telemetry"
[Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', '1', 'Machine')

Write-host "Setting HomeGroupProvider & HomeGroupListener service to Manual"
Set-Service -Name 'HomeGroupListener' -StartupType Manual
Set-Service -Name 'HomeGroupProvider' -StartupType Manual

function "Deleting Temp Files..."
Get-ChildItem -Path "C:\Windows\Temp" *.* -Recurse | Remove-Item -Force -Recurse
Get-ChildItem -Path $env:TEMP *.* -Recurse | Remove-Item -Force -Recurse

function System-Cleaner{
    cleanmgr.exe /d C: /VERYLOWDISK
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
}
Write-host "System Cleaner......"
System-Cleaner

function System-restore{
        try {
            # Try getting restore points to check if System Restore is enabled
            Enable-ComputerRestore -Drive "$env:SystemDrive"
        } catch {
            Write-Host "An error occurred while enabling System Restore: $_"
        }
    }
Write-host "Creating Restore Point"
System-restore

