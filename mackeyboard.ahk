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

#InstallKeybdHook
#SingleInstance force
SetTitleMatchMode 2
SendMode Input

; Media Keys

RAlt & F7::SendInput {Media_Prev}
RAlt & F8::SendInput {Media_Play_Pause}
RAlt & F9::SendInput {Media_Next}
F10::SendInput {Volume_Mute}
F11::SendInput {Volume_Down}
F12::SendInput {Volume_Up}

; Cursor Movement

; cmd + arrows - start & end of lines, with shift for selecting text
#{Left}::Send, {Home}
#{Right}::Send, {End}
#+{Left}::sendInput +{Home}
#+{Right}::Send, +{End}
!{Left}::Send, ^{Left}
!{Right}::Send, ^{Right}
!+{Left}::Send, ^+{Left}
!+{Right}::Send, ^+{Right}

; F13-15, standard windows mapping
F13::SendInput {PrintScreen}
F14::SendInput {ScrollLock}
F15::SendInput {Pause}

;F16-19 custom app launchers, see http://www.autohotkey.com/docs/Tutorial.htm for usage info
; F16::Run <Insert Project Homepage URL here>
; F17::Run <Insert Project ASSAI URL here>
; F18::Run <Insert Company Microsoft Teams URL here>
; F19::Run <Insert Company Yammer URL here>

; Eject Key
;F20::SendInput {Insert} ; F20 doesn't show up on AHK anymore, see #3

; MacOS System Shortcuts

; Open
#o::Send, ^o

; New
#n::Send, ^n

; Find
#f::Send, F3

; Select
#a::Send, ^a

; Cut
#x::Send, ^x

; Copy
#c::Send, ^c

; Paste
#v::Send, ^v

; Undo
#z::Send, ^z

; Redo
#y::Send, ^y

; Save
#s::Send, ^s

; Reply
#r::Send, ^r

; New tab
#t::Send, ^t

; Close tab
#w::Send, ^w

; Close a window
#w::Send, #{F4}

; Close application (cmd + q to Alt + F4)
#q::Send, !{F4}

; Remap Windows + Tab to Alt + Tab.
LWin & Tab::AltTab

; Browser bar
LWin & l::Send, F6

; Lock Screen
RWin & l::Send, #l

; minimize windows
#m::WinMinimize,a

; text expander snippets

::t=::TENDERER

::c=::COMPANY

; task done for to-do lists

; Get Date in ISO 8601 format with `txd`
:c*:txd::
  FormatTime, CurrentDateTime,, yyyy-MM-dd
  SendInput @done(%CurrentDateTime%)
Return

::addo::
(
Company Name
Company Address
)

; Application specific:

; In Cygwin
#IfWinActive, ahk_class mintty
; git commands

::gl=::git log --pretty=format:"%h - %an, %ar: %s"

::gc=::git commit -m ""

::gp=::git push -u origin master

#IfWinActive

; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1

; Show Web Developer Tools with cmd + alt + i
#!i::Send, {F12}

; Show source code with cmd + alt + u
#!u::Send, ^u

#IfWinActive

; Microsoft Outlook
#IfWinActive Microsoft Outlook ahk_class rctrl_renwnd32

::s-::--Chetan

::fyi::For your kind info.

::tx::Thank you

::wfh::working from home

::kr::Kind regards,

::pfa::please find attached

::mrq::
(
Dear All,

This is a meeting request to discuss 
)

::txe::Thank you for your message.

; Scripting replies in Outlook 2016 with AutoHotkey
; --------------------------------------------------------
; Hit Alt + x to create an email reply (template) with 
; salutation to sender's First Name from selected / opened 
; email in Microsoft Outlook, which looks like this:
; 
; Hi <FirstName>, 
; 
; Thank you for your email.
; 
; <Signature appears here, if set-up in Outlook>
; --------------------------------------------------------
!x::
ol := COMObjActive("Outlook.Application").ActiveExplorer.Selection.Item(1)
From := ol.SenderName
StringGetPos, pos, From, `,
if errorlevel
{
    StringGetPos, pos, From, %A_Space%
    StringLeft, From, From, pos
}
else
{
    StringTrimLeft, From, From, pos+2
}
StringUpper From, From, T
FirstName := RegExReplace(From, " .*", "")
SendInput, ^+r
Sleep, 100
SendInput, Hi %FirstName%, {Enter 2}Thank you for your email.{Enter 2}
Return
#IfWinActive

; Microsoft Word or Microsoft Excel
#If, WinActive("ahk_class OpusApp") or WinActive("ahk_class XLMAIN")

::tc=::TENDERER's response is noted. COMPANY considers this item closed.

::twq::TENDERER is requested to withdraw this qualification.

::tqn::This qualification is not required.

#If

; Skype for Business
#IfWinActive, ahk_class LyncTabFrameHostWindowClass

::gm::Good morning,

::gf::Good afternoon,

#IfWinActive
