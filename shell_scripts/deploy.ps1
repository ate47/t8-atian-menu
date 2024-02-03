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

    if (Test-Path .\build\compiler.zip) {
        Write-Host "Already there."
    }
    else {
        $Token | gh auth login --with-token
        gh release download --repo ate47/t7-compiler-custom latest -p deploy.zip --clobber -O build/compiler.zip
    }

    Write-Host "Extracting"

    if (Test-Path .\build\compiler) {
        Write-Host "Already there."
    }
    else {
        Expand-Archive .\build\compiler.zip .\build\compiler
    }

    if (!(Test-Path .\build\compiler)) {
        Write-Error "Can't find compiler"
        exit(-1);
    }

    Write-Host "Compiling project"

    
    Write-Host "PC / BO4"
    .\build\compiler\DebugCompiler.exe --compile -DCI -Cplatform=PC '-Coutputname=deploy/BlackOps4_atianmenu_pc'
    
    if (!$?) {
        Write-Error "Issue when compiling the project"
        exit -1
    }

    Write-Host "PS4 / BO4"
    .\build\compiler\DebugCompiler.exe --compile -DCI -D__PS4 -Cplatform=PS4 '-Coutputname=deploy/BlackOps4_atianmenu_ps4' -Cdll=false

    if (!$?) {
        Write-Error "Issue when compiling the project"
        exit -1
    }
    
    Write-Host "PC / CW"
    Set-Location coldwar
    ..\build\compiler\DebugCompiler.exe --compile -DCI -Cplatform=PC '-Coutputname=../deploy/BlackOpsColdWar_atianmenu_pc'
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
