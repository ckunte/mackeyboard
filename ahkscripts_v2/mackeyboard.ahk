; Mac Keyboard to Windows Key Mappings
; 2020 ckunte
;
; Credits to @mattheath and @stroebjo for the many
; key mappings:
; https://gist.github.com/mattheath/884982
; https://github.com/stroebjo/autohotkey-windows-mac-keyboard 
;
; Legend: Modifier Keys
; 
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
TraySetIcon "C:\Apps\misc\ahkscripts\macf.ico", 1
Return

; #NoEnv ; For security
; #KeyHistory 0
; #InstallKeybdHook
#SingleInstance force
; SetTitleMatchMode 2
; SendMode Input

; Media Keys

RAlt & F7::SendInput "{Media_Prev}"
RAlt & F8::SendInput "{Media_Play_Pause}"
RAlt & F9::SendInput "{Media_Next}"
RAlt & F10::SendInput "{Volume_Mute}"
RAlt & F11::SendInput "{Volume_Down}"
RAlt & F12::SendInput "{Volume_Up}"

; F13-15, standard windows mapping
F13::SendInput "{PrintScreen}"
F14::SendInput "{ScrollLock}"
F15::SendInput "{Pause}"

;F16-19 custom app launchers, see http://www.autohotkey.com/docs/Tutorial.htm for usage info
; F16::Run <Insert Project Homepage URL here>
; F17::Run <Insert Project ASSAI URL here>
; F18::Run <Insert Company Microsoft Teams URL here>
; F19::Run <Insert Company Yammer URL here>

; Eject Key
;F20::SendInput {Insert} ; F20 doesn't show up on AHK anymore, see #3

; MacOS System Shortcuts (from https://support.apple.com/en-au/HT201236 )

; Cut
#x::SendInput "^x"

; Copy
#c::SendInput "^c"

; Del
#BS:: SendInput "{Del}"

; Paste
#v::SendInput "^v"

; Undo
#z::SendInput "^z"

; Redo
+#z::SendInput "^y"

; Select All
#a::SendInput "^a"

; Find
#f::SendInput "^f"

; Find Next
#g::SendInput "{F3}"

; minimize windows
#m::WinMinimize "a"

; Open
#o::SendInput "^o"

; Print (this leaves RWin + p for projector settings)
LWin & p::SendInput "^p"

; Save
#s::SendInput "^s"

; New tab
#t::SendInput "^t"

; New
#n::SendInput "^n"

; Reply
#r::SendInput "^r"

; Close a window
LWin & w::SendInput "^w"

; Close application (cmd + q to Alt + F4)
LWin & q::SendInput "!{F4}"

; Document shortcuts

; Boldface
#b::SendInput "^b"

; Italicise
#i::SendInput "^i"

; Cursor Movement (w/ Text Select if Shift is pressed): Home, End, PageUp and PageDown Mac style

#Include C:\Apps\misc\ahkscripts\cursor_mac_style.ahk

; Remap Windows + Tab to Alt + Tab.
LWin & Tab::AltTab

; text expander snippets

#Include C:\Apps\misc\ahkscripts\textexpander.ahk

