$path = Resolve-Path 'public\index.html'
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# Read as UTF-8
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
$lines = $content -split "`r`n"

# Delete lines 9567 to 9931 (0-indexed: 9566 to 9930)
$kept = $lines[0..9565] + $lines[9931..($lines.Length - 1)]
$out = $kept -join "`r`n"

[System.IO.File]::WriteAllText($path, $out, $utf8NoBom)
Write-Host "Done. Lines before: $($lines.Length), after: $($kept.Length)"
