:*:tx::Thank you

:*:wfh::working from home

:*:t=::TENDERER

:*:c=::COMPANY

; task done for to-do lists

:c*:ds::
  FormatTime, CurrentDateTime,, yyyy-MM-dd H:m
  SendInput @done(%CurrentDateTime%)
Return

:c*:rck::
  FormatTime, CurrentDateTime,, yyyy-MM-dd
  SendInput Reviewed and acknowledged. (%CurrentDateTime%)
Return

:c*:rsp::
  FormatTime, CurrentDateTime,, yyyy-MM-dd
  SendInput Reviewed and supported. (%CurrentDateTime%)
Return

; Application specific:

; In Microsoft Word or Microsoft Excel only
#If, WinActive("ahk_class OpusApp") or WinActive("ahk_class XLMAIN")

::tc=::TENDERER's response is noted. COMPANY considers this item closed.

::twq::TENDERER is requested to withdraw this qualification.

::tqn::This qualification is not required.

#If

;In Word, Google Chrome, MS Teams, Outlook, or Skype only

#If, WinActive("ahk_class OpusApp") or WinActive("ahk_class rctrl_renwnd32") or WinActive("ahk_class LyncTabFrameHostWindowClass") or WinActive("ahk_class Chrome_WidgetWin_1")

; bracket and quote completion (albeit w/o selected text)

#Include, C:\Apps\misc\ahk\bra.ahk
#Include, C:\Apps\misc\ahk\twrap.ahk

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
