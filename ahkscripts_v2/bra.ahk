:*?:(::{
    Send "{Raw}()"
    Send "{Left 1}"
    return
}

:*?:(::{
    Send "{Raw}()"
    Send "{Left 1}"
    return
}

:*:'::{
    Send "{Raw}''"
    Send "{Left 1}"
    return
}

:*:"::{
    Send '{Raw}""'
    Send '{Left 1}'
    return
}

:*?:{::{
    Send "{Raw}{}"
    Send "{Left 1}"
    return    
}

:*?:[::{
    Send "{Raw}[]"
    Send "{Left 1}"
    return
}

^):: {
    SendEvent "^c" ; presumes text is selected
    cSelected := A_Clipboard ; 
    ClipWait
    Send "(" cSelected ")"
}
