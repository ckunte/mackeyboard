; Cursor Movement: Home, End, PageUp and PageDown Mac style

; Cursor Movement (w/ Text Select if Shift is pressed): Home, End, PageUp and PageDown Mac style

LWin & Left::
If GetKeyState("Shift")
 Send, +{Home}
Else Send, {Home}
Return

LWin & Right::
If GetKeyState("Shift")
 Send, +{End}
Else Send, {End}
Return

LWin & Up::Send, {PgUp}
LWin & Down::Send, {PgDn}
