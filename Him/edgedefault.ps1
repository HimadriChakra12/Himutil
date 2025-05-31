$edgeProgId = "MSEdgeHTM"

$associations = @{
    "htmlfile" = $edgeProgId
    "http"     = $edgeProgId
    "https"    = $edgeProgId
}

foreach ($type in $associations.Keys) {
    $keyPath = "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\$type\UserChoice"
    if (-not (Test-Path $keyPath)) {
        New-Item -Path $keyPath -Force
    }
    Set-ItemProperty -Path $keyPath -Name ProgId -Value $associations[$type]
}

