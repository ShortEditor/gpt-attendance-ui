# Reverse the Mojibake: file was read as Windows-1252 then written as UTF-8
# Fix: read current garbled UTF-8, re-encode as Win-1252 bytes, interpret as original UTF-8

$path = Resolve-Path 'public\index.html'
$win1252 = [System.Text.Encoding]::GetEncoding(1252)
$utf8    = [System.Text.Encoding]::UTF8

# Step 1: Read the currently garbled file as UTF-8 text
$garbled = [System.IO.File]::ReadAllText($path, $utf8)

# Step 2: Encode as Windows-1252 bytes → these are the ORIGINAL UTF-8 bytes
$originalBytes = $win1252.GetBytes($garbled)

# Step 3: Decode those bytes as UTF-8 → restored original text
$fixed = $utf8.GetString($originalBytes)

# Step 4: Write back as UTF-8 (no BOM)
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($path, $fixed, $utf8NoBom)

Write-Host "Done. File size: $((Get-Item $path).Length) bytes"
