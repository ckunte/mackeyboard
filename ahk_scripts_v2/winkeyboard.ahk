#Requires AutoHotkey v2.0

; Some shortcuts and text expander for Windows
; 2017 ckunte

; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
; Menu Tray Icon C:\Apps\misc\ahkscripts\bb8.ico
; Return
; #NoEnv ; For security
; #KeyHistory 0
; #InstallKeybdHook
; #SingleInstance force
; SetTitleMatchMode 2
; SendMode Input

; ------------------------------------------------------
; media / functions keys all mapped to the right alt key
; ------------------------------------------------------

; LWin & F7::SendInput {Media_Prev}
; LWin & F8::SendInput {Media_Play_Pause}
; LWin & F9::SendInput {Media_Next}
; LWin & F10::SendInput {Volume_Mute}

; Close a window
LWin & w::Send "^w"

; Close application (cmd + q to Alt + F4)
LWin & q::Send "!{F4}"

; text expander snippets

#Include C:\Apps\misc\ahkscripts\textexpander.ahk

; For the "MagicForce Smart 49" keyboard

; #Include C:\Apps\misc\ahkscripts\magicforce.ahk