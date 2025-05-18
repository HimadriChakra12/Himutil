Write-host "Setting up Display for Performance...."
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](144,18,3,128,16,0,0,0))

Write-host "Disabling Copilot...."
dism /online /remove-package /package-name:Microsoft.Windows.Copilot

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
        # Don't show the progress because it will slow down the download speed
        $ProgressPreference='SilentlyContinue'

        Invoke-WebRequest -Uri $url -OutFile "$env:TEMP\AdobeCreativeCloudCleanerTool.exe" -UseBasicParsing -ErrorAction SilentlyContinue -Verbose

        # Revert back the ProgressPreference variable to the default value since we got the file desired
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
