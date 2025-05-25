$osInfo = Get-CimInstance Win32_OperatingSystem
$version = [System.Version]$osInfo.Version
$buildNumber = [int]$osInfo.BuildNumber

if ($version.Major -eq 10 -and $buildNumber -lt 22000) {
    Write-Host "Windows 10 detected"
        Write-Host "Running Windows 10 specific command..."
        $cmdUrl = "https://raw.githubusercontent.com/HimadriChakra12/Himutil/refs/heads/master/Activator/10act.cmd"

}
elseif ($version.Major -eq 10 -and $buildNumber -ge 22000) {
    Write-Host "Windows 11 detected"
        Write-Host "Running Windows 11 specific command..."
        $cmdUrl = "https://raw.githubusercontent.com/HimadriChakra12/Himutil/refs/heads/master/Activator/11act.cmd"
}
else {
    Write-Host "Unsupported Windows version: $version (Build $buildNumber)"
}
$cmdFile = "$env:LOCALAPPDATA\Temp\himact.cmd"
Invoke-WebRequest -Uri $cmdUrl -OutFile $cmdFile
start-process "$cmdFile" -wait
Start-Sleep -Seconds 1
Remove-Item -Path $cmdFile -Force
