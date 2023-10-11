param()

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location ($base.Fullname)

    $compilerPath = (Get-Item (Get-Command debugcompiler.exe).Source).Parent

    # Set the ps4 opcodes
    Copy-Item "$compilerPath/vm_codes_pc.db2" "$compilerPath/vm_codes.db2" -Force

    debugcompiler.exe --build --noupdate

    if (!$?) {
        Write-Error "Error when compiling";
        exit -1;
    }
}
finally {
    $prevPwd | Set-Location
}
