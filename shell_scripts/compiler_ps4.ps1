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
    Set-Location ($base.Fullname)

    debugcompiler.exe --compile --noupdate "-Cplatform=PS4" -D__PS4 -DATIAN_MENU_DEV
    if (!$?) {
        Write-Error "Error when compiling";
        exit -1;
    }

    if (!$Compile) {
        acts.exe ps4_t8cee $ip
        acts.exe ps4_inject $ip compiled.gscc "$hook" "$replaced"
    }

}
finally {
    $prevPwd | Set-Location
}
