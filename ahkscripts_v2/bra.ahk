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

^+):: {
    ClipSaved := ClipboardAll()
    SendEvent "^c"
    cSelected := A_Clipboard
    Sleep 10
    A_Clipboard := ClipSaved
    ;MsgBox cSelected
    Send "(" cSelected ")"
    A_Clipboard := ""
}
