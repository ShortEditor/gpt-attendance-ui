$f = [System.IO.File]::ReadAllBytes('public\index.html')
$idx = 0
for($i=0; $i -lt $f.Length; $i++){
    if($f[$i] -eq 0xF0){
        Write-Host ("Pos {0}: {1} {2} {3} {4}" -f $i, $f[$i], $f[$i+1], $f[$i+2], $f[$i+3])
        $idx++
        if($idx -ge 3){ break }
    }
}
Write-Host "Total file bytes: $($f.Length)"
