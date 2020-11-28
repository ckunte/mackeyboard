; Some shortcuts and text expander for Windows
; 2017 ckunte

; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

#NoEnv ; For security
#KeyHistory 0
#InstallKeybdHook
#SingleInstance force
SetTitleMatchMode 2
SendMode Input

; ------------------------------------------------------
; media / functions keys all mapped to the right alt key
; ------------------------------------------------------

RAlt & F7::SendInput {Media_Prev}
RAlt & F8::SendInput {Media_Play_Pause}
RAlt & F9::SendInput {Media_Next}
RAlt & F10::SendInput {Volume_Mute}
RAlt & F11::SendInput {Volume_Down}
RAlt & F12::SendInput {Volume_Up}

; Close a window
LWin & w::Send, ^w

; Close application (cmd + q to Alt + F4)
LWin & q::Send, !{F4}

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

; text expander snippets

#Include, C:\Apps\misc\ahk\textexpander.ahk
