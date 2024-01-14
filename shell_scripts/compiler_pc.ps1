param(
    [switch]
    $Compile
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location ($base.Fullname)

    $compilerPath = (Get-Item ((Get-Command debugcompiler.exe).Source)).FullName | split-path -parent

    $arg = if ($Compile){ "--compile" } else { "--build" };

    debugcompiler.exe $arg --noupdate `
        "-platform=PC" `
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
