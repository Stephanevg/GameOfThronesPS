function Get-GOTObject {

    Param(
    
        $Query,
        $Filter
    
    )

    $MainUrl = 'http://www.anapioficeandfire.com/api'
    Invoke-RestMethod -Method Get -Uri ($MainUrl + $Query + $filter)

}