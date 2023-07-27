; Cursor Movement: Home, End, PageUp and PageDown Mac style

; Cursor Movement (w/ Text Select if Shift is pressed): Home, End, PageUp and PageDown Mac style

LWin & Left::{
    if GetKeyState("Shift")    
        SendInput "+{Home}"
    else 
        SendInput "{Home}"
    return
}

LWin & Right::{
    if GetKeyState("Shift")
        SendInput "+{End}"
    else 
        SendInput "{End}"
    return    
}

LWin & Up::SendInput "{PgUp}"
LWin & Down::SendInput "{PgDn}"
