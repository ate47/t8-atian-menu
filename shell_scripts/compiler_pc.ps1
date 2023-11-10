param(
    [switch]
    $Compile
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location ($base.Fullname)

    $compilerPath = (Get-Item ((Get-Command debugcompiler.exe).Source)).FullName | split-path -parent

    # Set the pc opcodes
    Copy-Item "$compilerPath/vm_codes_pc.db2" "$compilerPath/vm_codes.db2" -Force

    $arg = if ($Compile){ "--compile" } else { "--build" };

    debugcompiler.exe $arg --noupdate `
        "-Cclient=false" "-Cdll=true" "-Cdll.lazylink=true" "-Cdll.builtins=true" "-Cdll.detours=true" `
        "-DATIAN_MENU_DEV" #"-DATIAN_MENU_LOOKUP_BIG"

    if (!$?) {
        Write-Error "Error when compiling";
        exit -1;
    }
}
finally {
    $prevPwd | Set-Location
}
