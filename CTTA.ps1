Write-host "Setting up Display for Performance...."
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](144,18,3,128,16,0,0,0))

Write-host "Disabling Copilot...."
dism /online /remove-package /package-name:Microsoft.Windows.Copilot

function CCStopper {
    $path = "C:\Program Files (x86)\Common Files\Adobe\Adobe Desktop Common\ADS\Adobe Desktop Service.exe"
        if (Test-Path $path) {
            Takeown /f $path
                $acl = Get-Acl $path
                $acl.SetOwner([System.Security.Principal.NTAccount]"Administrators")
                $acl | Set-Acl $path

                Rename-Item -Path $path -NewName "Adobe Desktop Service.exe.old" -Force
        } else {
            Write-Host "Adobe Desktop Service is not in the default location."
        }
}

function AcrobatUpdates {
    $rootPath = "HKLM:\SOFTWARE\WOW6432Node\Adobe\Adobe ARM\Legacy\Acrobat"
        $subKeys = Get-ChildItem -Path $rootPath | Where-Object { $_.PSChildName -like "{*}" }
    foreach ($subKey in $subKeys) {
        $fullPath = Join-Path -Path $rootPath -ChildPath $subKey.PSChildName
            try {
                Set-ItemProperty -Path $fullPath -Name Mode -Value 0
                    Write-Host "Acrobat Updates have been disabled."
            } catch {
                Write-Host "Registry Key for changing Acrobat Updates does not exist in $fullPath"
            }
    }
}
write-host "Debloating Adobe.."
CCStopper
AcrobatUpdates

function Rm-acc {
    <#
        .SYNOPSIS
        It removes or fixes problem files and resolves permission issues in registry keys.
        .DESCRIPTION
        The Creative Cloud Cleaner tool is a utility for experienced users to clean up corrupted installations.
#>
        [string]$url="https://swupmf.adobe.com/webfeed/CleanerTool/win/AdobeCreativeCloudCleanerTool.exe"
        Write-Host "The Adobe Creative Cloud Cleaner tool is hosted at"
            Write-Host "$url"

            try {
                $ProgressPreference='SilentlyContinue'
                    Invoke-WebRequest -Uri $url -OutFile "$env:TEMP\AdobeCreativeCloudCleanerTool.exe" -UseBasicParsing -ErrorAction SilentlyContinue -Verbose
                    $ProgressPreference='Continue'
                    Start-Process -FilePath "$env:TEMP\AdobeCreativeCloudCleanerTool.exe" -Wait -ErrorAction SilentlyContinue -Verbose
            } catch {
                Write-Error $_.Exception.Message
            } finally {
                if (Test-Path -Path "$env:TEMP\AdobeCreativeCloudCleanerTool.exe") {
                    Write-Host "Cleaning up..."
                        Remove-Item -Path "$env:TEMP\AdobeCreativeCloudCleanerTool.exe" -Verbose
                }
            }
}
write-host "Removing AdobeCreativeCloud..."
Rm-acc

function ul-powplan{
    $ultimatePlan = powercfg -list | Select-String -Pattern "Ultimate Performance"
        if ($ultimatePlan) {
            Write-Host "Ultimate Performance plan is already installed."
        } else {
            Write-Host "Installing Ultimate Performance plan..."
                powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
                Write-Host "> Ultimate Performance plan installed."
        }
# Set the Ultimate Performance plan as active
    $ultimatePlanGUID = (powercfg -list | Select-String -Pattern "Ultimate Performance").Line.Split()[3]
        powercfg -setactive $ultimatePlanGUID

        Write-Host "Ultimate Performance plan is now active."
}
write-host "Enableing Ultimate Performance Plan..."
ul-powplan
