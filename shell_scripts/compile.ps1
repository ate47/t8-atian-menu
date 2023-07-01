param(
    $DownloadLink = "https://github.com/shiversoftdev/t7-compiler/releases/latest/download/update.zip",
    [switch]
    $NoDownload
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location ($base.Fullname)

    New-Item -ItemType Directory build -ErrorAction Ignore > $null
    

    Write-Host "Downloading Serious' compiler"
    
    if (Test-Path .\build\compiler.zip) {
        Write-Host "Already there."
    } else {
        Invoke-WebRequest -Uri $DownloadLink -OutFile .\build\compiler.zip
    }

    Write-Host "Extracting"

    if (Test-Path .\build\compiler) {
        Write-Host "Already there."
    } else {
        Expand-Archive .\build\compiler.zip .\build\compiler
    }

    Write-Host "Compiling project"

    .\build\compiler\t7compiler\DebugCompiler.exe --compile --noupdate -DCI

    if (!$?) {
        Write-Error "Issue when compiling the project"
        exit -1
    }

    Write-Host "Project compiled."
}
finally {
    $prevPwd | Set-Location
}
