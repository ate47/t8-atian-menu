param(
    $ip = "10.0.0.15:9090",
    $replaced = "scripts\core_common\clientids_shared.gsc",
    $hook = "scripts\core_common\load_shared.gsc",
    [switch]
    $Compile
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location "$($base.Fullname)/coldwar"


    debugcompiler.exe "--compile" "-DATIAN_MENU_DEV" "-Cplatform=PS4" "-Cgame=T937"

    if (!$?) {
        Write-Error "Error when compiling";
        exit -1;
    }

    if (!$Compile) {
        acts.exe ps4_injectcw100 $ip compiled.gscc "$hook" "$replaced"
    }
}
finally {
    $prevPwd | Set-Location
}
