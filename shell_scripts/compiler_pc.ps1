param(
    [switch]
    $Compile,
    $Deploy = $null
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location ($base.Fullname)

    $arg = if ($Compile){ "--compile" } else { "--build" };

    debugcompiler.exe $arg --noupdate `
        "-Cplatform=PC" `
        "-Cclient=false" "-Cdll=true" "-Cdll.lazylink=true" "-Cdll.builtins=true" "-Cdll.detours=true" `
        "-DATIAN_MENU_DEV" "-DSHIELD_GSC_DEPLOY" #"-DATIAN_MENU_LOOKUP_BIG"

    if (!$?) {
        Write-Error "Error when compiling";
        exit -1;
    }

    if ($null -ne $Deploy) {
        Copy-Item compiled.gsic $Deploy -Force
        Copy-Item hashes.txt $Deploy -Force

        Write-Host "Deployed to $Deploy"
    }
}
finally {
    $prevPwd | Set-Location
}
