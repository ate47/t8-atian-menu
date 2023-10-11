param(
    $ip = "10.0.0.15:9090",
    $replaced = "scripts\core_common\clientids_shared.gsc",
    $hook = "scripts\core_common\load_shared.gsc"
)

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot).Parent
    Set-Location ($base.Fullname)

    $compilerPath = (Get-Item (Get-Command debugcompiler.exe).Source).Parent

    # Set the ps4 opcodes
    Copy-Item "$compilerPath/vm_codes_ps4.db2" "$compilerPath/vm_codes.db2" -Force

    debugcompiler.exe --compile --noupdate -D__PS4

    if (!$?) {
        Write-Error "Error when compiling";
        exit -1;
    }

    acts.exe ps4_t8cee $ip
    acts.exe ps4_inject $ip compiled.gscc "$hook" "$replaced"

}
finally {
    $prevPwd | Set-Location
}
