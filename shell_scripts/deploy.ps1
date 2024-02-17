param(
    $Token
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location ($base.Fullname)

    New-Item -ItemType Directory build -ErrorAction Ignore > $null
    New-Item -ItemType Directory deploy -ErrorAction Ignore > $null
    
    Write-Host "Downloading Custom Serious' compiler"

    if (Test-Path .\build\compilercustom.zip) {
        Write-Host "Already there."
    }
    else {
        $Token | gh auth login --with-token
        gh release download --repo ate47/t7-compiler-custom latest -p deploy.zip --clobber -O build/compilercustom.zip
    }

    Write-Host "Extracting"

    if (Test-Path .\build\compilercustom) {
        Write-Host "Already there."
    }
    else {
        Expand-Archive .\build\compilercustom.zip .\build\compilercustom
    }

    if (!(Test-Path .\build\compilercustom)) {
        Write-Error "Can't find compiler"
        exit(-1);
    }

    Write-Host "Compiling project"

    
    Write-Host "PC / BO4"
    .\build\compilercustom\DebugCompiler.exe --compile -DCI -Cplatform=PC '-Coutputname=deploy/BlackOps4_atianmenu_pc'
    
    if (!$?) {
        Write-Error "Issue when compiling the project"
        exit -1
    }

    Write-Host "Shield PC / BO4"
    New-Item -ItemType Directory build/atianmenu -ErrorAction Ignore > $null
    Copy-Item metadata.json build/atianmenu
    .\build\compilercustom\DebugCompiler.exe --compile -DCI -Cplatform=PC `
        "-Cclient=false" "-Cdll=true" "-Cdll.lazylink=true" "-Cdll.builtins=true" "-Cdll.detours=true" `
        '-DSHIELD_GSC_DEPLOY' `
        '-Coutputname=build/atianmenu/atianmenu_shield'
    if (!$?) {
        Write-Error "Issue when compiling the project"
        exit -1
    }
    Copy-Item hashes.txt build/atianmenu
    Set-Location build
    Compress-Archive atianmenu -DestinationPath "../deploy/BlackOps4_shield_atianmenu.zip" -Force
    Set-Location ..


    Write-Host "PS4 / BO4"
    .\build\compilercustom\DebugCompiler.exe --compile -DCI -D__PS4 -Cplatform=PS4 '-Coutputname=deploy/BlackOps4_atianmenu_ps4' -Cdll=false

    if (!$?) {
        Write-Error "Issue when compiling the project"
        exit -1
    }
    
    Write-Host "PC / CW"
    Set-Location coldwar
    ..\build\compilercustom\DebugCompiler.exe --compile -DCI -Cplatform=PC -Cgame=T9 '-Coutputname=../deploy/BlackOpsColdWar_atianmenu_pc'
    Set-Location ..
    if (!$?) {
        Write-Error "Issue when compiling the project"
        exit -1
    }

    Write-Host "Project compiled."
}
finally {
    $prevPwd | Set-Location
}
