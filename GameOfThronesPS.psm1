$ScriptPath = Split-Path $MyInvocation.MyCommand.Path

write-verbose "Loading Classes"
$Classes = gci "$ScriptPath\Classes" -Filter "Class_*.ps1" | Select -Expand FullName


foreach ($Class in $Classes){
    write-verbose "importing Class $($Class)"
    try{
        . $Class
    }catch{
        write-warning $_
    }
}

#Loading Private Functions 

write-verbose "Loading Private Functions"
$PrivateFunctions = gci "$ScriptPath\Functions\Private" -Filter *.ps1 | Select -Expand FullName


foreach ($Private in $PrivateFunctions){
    write-verbose "importing function $($function)"
    try{
        . $Private
    }catch{
        write-warning $_
    }
}

Write-verbose "Loading Public functinos"
$PublicFunctions = gci "$ScriptPath\Functions\Public" -Filter *.ps1 | Select -Expand FullName


foreach ($Public in $PublicFunctions){
    write-verbose "importing function $($function)"
    try{
        . $Public
    }catch{
        write-warning $_
    }
}

#Loading URL file

$UrlFile = gci "$ScriptPath\Functions\Private\GOT_data.psd1" | Select -Expand FullName

write-verbose "Importing Urls data file: $($urlfile)"
$dataFile = Import-PowerShellDataFile -Path $UrlFile


$RC_Data = New-Object psobject -property $datafile

Export-ModuleMember -Function * -Variable GOT_Data