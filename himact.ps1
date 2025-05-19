# Configuration
$cmdUrl = "https://raw.githubusercontent.com/HimadriChakra12/Himutil/refs/heads/master/himact.cmd"  # Replace with your actual raw URL
$cmdFile = "$env:TEMP\himact.cmd"

# Download the CMD file
Invoke-WebRequest -Uri $cmdUrl -OutFile $cmdFile

# Execute the CMD file
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$cmdFile`"" -Wait

# Optional delay before cleanup if needed
Start-Sleep -Seconds 1

# Clean up
Remove-Item -Path $cmdFile -Force
