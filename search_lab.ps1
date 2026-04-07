$content = Get-Content 'public\index.html' -Raw
$lines = $content -split "`n"
$keywords = @('smTab','pmTab','splitCIA','downloadCIA','Lab Assessment','sm_tab','pm_tab','CIA','generateLab','labMark','smMode','pmMode','vivaMarks','c1Marks','c2Marks','calcCIA','calcTotal')
$found = @()
for ($i = 0; $i -lt $lines.Count; $i++) {
    foreach ($kw in $keywords) {
        if ($lines[$i] -match $kw) {
            $lineNum = $i + 1
            $preview = $lines[$i].Trim().Substring(0, [Math]::Min(140, $lines[$i].Trim().Length))
            $found += "${lineNum}: ${preview}"
            break
        }
    }
}
$found | Select-Object -First 60
Write-Host "Total matches: $($found.Count)"
