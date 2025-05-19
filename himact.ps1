param (
    [switch]$Wait
)

# Configuration
$cmdUrl = "https://raw.githubusercontent.com/HimadriChakra12/Himutil/refs/heads/master/himact.cmd"  # Replace with your actual raw URL
$cmdFile = "$env:TEMP\temp_script.cmd"

# Download the CMD file
Invoke-WebRequest -Uri $cmdUrl -OutFile $cmdFile

# Execute the CMD file
if ($Wait) {
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$cmdFile`"" -Wait
} else {
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$cmdFile`""
}

# Optional delay before cleanup if needed
Start-Sleep -Seconds 1

# Clean up
Remove-Item -Path $cmdFile -Force
