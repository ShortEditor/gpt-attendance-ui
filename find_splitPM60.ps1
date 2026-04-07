$lines = Get-Content 'public\index.html'
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match 'splitPM60') {
        Write-Output (($i+1).ToString() + ': ' + $lines[$i].Trim().Substring(0, [Math]::Min(120, $lines[$i].Trim().Length)))
    }
}
