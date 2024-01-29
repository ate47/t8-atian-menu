param(
    [switch]
    $Compile
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location "$($base.Fullname)/coldwar"

    $arg = if ($Compile) { "--compile" } else { "--build" };

    debugcompiler.exe $arg --noupdate

    if (!$?) {
        Write-Error "Error when compiling";
        exit -1;
    }
}
finally {
    $prevPwd | Set-Location
}
