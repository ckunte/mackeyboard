; Some shortcuts and text expander for Windows
; 2017 ckunte

; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

#InstallKeybdHook
#SingleInstance force
SetTitleMatchMode 2
SendMode Input

; ------------------------------------------------------
; media / functions keys all mapped to the right alt key
; ------------------------------------------------------

; RAlt & F7::SendInput {Media_Prev}
; RAlt & F8::SendInput {Media_Play_Pause}
; RAlt & F9::SendInput {Media_Next}
; RAlt & F10::SendInput {Volume_Mute}
; RAlt & F11::SendInput {Volume_Down}
; RAlt & F12::SendInput {Volume_Up}

; text expander snippets

::tx::Thank you

::wfh::working from home

::t=::TENDERER

::c=::COMPANY

; task done for to-do lists
:c*:txd::
  FormatTime, CurrentDateTime,, yyyy-MM-dd
  SendInput @done(%CurrentDateTime%)
Return

; Application specific:

; In Microsoft Word or Microsoft Excel only
#If, WinActive("ahk_class OpusApp") or WinActive("ahk_class XLMAIN")

::tc=::TENDERER's response is noted. COMPANY considers this item closed.

::twq::TENDERER is requested to withdraw this qualification.

::tqn::This qualification is not required.

#If

; In Skype for Business only
#IfWinActive ahk_class LyncTabFrameHostWindowClass

::gm::Good morning,

::gf::Good afternoon,

#IfWinActive

; In Microsoft Outlook only
#IfWinActive ahk_class rctrl_renwnd32
::s-::--Chetan

::fyi::For your kind info.

::kr::Kind regards,

::pfa::please find attached

::mrq::
(
Dear All,

This is a meeting request to discuss 
)

::txe::Thank you for your message.

::addo::
(
Address line 1
Address line 2
)

; Scripting replies in Outlook 2016 with AutoHotkey
; Hit Ctrl + Win + r to create a reply email (template) with salutation to sender's 
; First Name from selected / opened email in Microsoft Outlook, which looks like this:
; 
; Hi <FirstName>, 
; 
; Thank you for your email.
; 
; <Signature appears here, if set-up in Outlook>
;
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
