param(
    [switch]
    $Compile
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location ($base.Fullname)

    $arg = if ($Compile){ "--compile" } else { "--build" };

    debugcompiler.exe $arg --noupdate `
        "-Cplatform=PC" `
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
