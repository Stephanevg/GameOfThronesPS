
Function Get-GOTHouse {
    Param(
        $Name,
        $Region,
        $Words,
        $HAsTitles,
        $HasSeats,
        $HasDiedOut,
        $HasAncestralWeapons
    )

    if ($Filter){
    
    }else{
        $Houses = Get-GOTObject -Query '/houses/'
    }
    

    return $Houses
}
