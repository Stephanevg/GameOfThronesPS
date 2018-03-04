Function Get-GOTBooks {
    Param(
        $Name,
        $id
    )

    if ($Name){
        
        $filter = "?name=$name"
        $return = Get-GOTObject -Query '/books/' -Filter $filter

    }elseif($id){

        $return = Get-GOTObject -Query '/books/' -Filter $id
    
    }else{
        $return = Get-GOTObject -Query '/books/'
    }
    

    return $return
}