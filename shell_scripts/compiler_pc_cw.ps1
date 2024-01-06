param(
    [switch]
    $Compile
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location "$($base.Fullname)/coldwar"

    $compilerPath = (Get-Item ((Get-Command debugcompiler.exe).Source)).FullName | split-path -parent

    # Set the pc opcodes
    Copy-Item "$compilerPath/vm_codes_pc.db2" "$compilerPath/vm_codes.db2" -Force

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
