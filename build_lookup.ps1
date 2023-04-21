param(
    $LookupFile = "$((Get-Item $PSScriptRoot).Fullname)/lookup.txt"
)

$LookupFileData = Get-Content $LookupFile

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot)
    Set-Location ($base.Fullname)
    
    Set-Location scripts/utils

    @"
// this file was created using the build_lookup.ps1 script, do no write in it!!!
// a basic lookup function, not all the hashes are here, but enough to give information
hash_lookup(hash_value) {
    switch (hash_value) {
$(($LookupFileData | Sort-Object | ForEach-Object {
    $line = $_
    "        case #`"$line`": return `"$line`";"
}) -join "`n")
        default: return hash_value;
    }
}
"@ | Out-File -Encoding utf8 lookup.gsc

}
finally {
    $prevPwd | Set-Location
}