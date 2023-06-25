param(
    $LookupFile = "$((Get-Item $PSScriptRoot).Fullname)/lookup.txt",
    $LookupFileStruct = "$((Get-Item $PSScriptRoot).Fullname)/lookup_structs.txt",
    [switch]
    $Big
)

$LookupFileData = Get-Content $LookupFile

$prevPwd = $PWD

try {
    $base = (Get-Item $PSScriptRoot)
    Set-Location ($base.Fullname)
    
    Set-Location scripts\core_common

    if ($Big) {
        @"
// this file was created using the build_lookup.ps1 script, do no write in it!!!
// a basic lookup function, not all the hashes are here, but enough to give information
autoexec __register_lookup_big__() {
    level.hash_lookup_big = &hash_lookup_big;
}

hash_lookup_big(hash_value) {
    if (isdefined(level.hash_lookup_big)) {
        // checking big version (is described)
        res = [[ level.hash_lookup_big ]](hash_value);
        if (isdefined(res)) {
            return res;
        }
    }
    if (!isdefined(hash_value)) {
        return undefined;
    }
    switch (hash_value) {
$(($LookupFileData | ForEach-Object {
    $line = $_
    "        case #`"$line`": return `"$line`";"
}) -join "`n")
        default: return undefined;
    }
}
"@ | Out-File -Encoding utf8 lookup_big.gsc
    }
    else {
        @"
// this file was created using the build_lookup.ps1 script, do no write in it!!!
// a basic lookup function, not all the hashes are here, but enough to give information
hash_lookup(hash_value) {
    if (isdefined(level.hash_lookup_big)) {
        // checking big version (is described)
        res = [[ level.hash_lookup_big ]](hash_value);
        if (isdefined(res)) {
            return res;
        }
    }
    if (!isdefined(hash_value)) {
        return undefined;
    }
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

}
finally {
    $prevPwd | Set-Location
}

$LookupFileData = Get-Content $LookupFileStruct

try {
    $base = (Get-Item $PSScriptRoot)
    Set-Location ($base.Fullname)
    
    Set-Location scripts\core_common\dev

        @"
// this file was created using the build_lookup.ps1 script, do no write in it!!!
// a basic struct lookup function, not all the canon. ids are here, but enough to give information
// search the elements of a struct (please help me if you know how to do it without injecting a custom function in the vm)
get_struct_explorer_values(obj) {
    elements = [];

$(($LookupFileData | Sort-Object | ForEach-Object {
    $line = $_
    if ($line.Length -ne 0) {
        "    elements = add_struct_explorer_value(elements, `"$line`", obj.$line);"
    }
}) -join "`n")
    
    return elements;
}
"@ | Out-File -Encoding utf8 lookup_structs.gsc
}
finally {
    $prevPwd | Set-Location
}