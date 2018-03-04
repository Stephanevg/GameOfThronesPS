
Function Get-GOTCharacters {
    Param(
        [string]$Name,
        [int]$id,
        $gender,
        [string]$culture,
        [datetime]$yearofbirth,
        [datetime]$yearofdeath,
        [bool]$isAlive
    )

    if ($Name){
        
        $filter = "?name=$name"
        $return = Get-GOTObject -Query '/books/' -Filter $filter

    }elseif($id){

        $return = Get-GOTObject -Query '/books/' -Filter $id
    
    }else{
        $Houses = Get-GOTObject -Query '/characters/'
    }
    

    return $Houses
}