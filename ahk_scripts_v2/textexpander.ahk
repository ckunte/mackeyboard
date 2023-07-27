; Updated for AHK V2

; Degree symbol
:*:,deg::{U+00B0}

; Emdash symbol
:*:,m::{U+2014}

; Endash symbol
:*:,n::{U+2013}

; Section symbol
::,s::{U+00A7}

::ty::Thank you

::kl::Kuala Lumpur

::nr::Not reviewed.

::tx::
(
Thanks,
)

:*:,dc::
(
COMPANY's review shall not absolve CONTRACTOR of their duty to demonstrate due diligence and uphold quality control. CONTRACTOR is fully responsible for exhibiting complete adherence to all contractual requirements, including, but not limited to, BDEP requirements, applicable standards, querying interfaces, and the incorporation of all pertinent information into the design. Such responsibility encompasses addressing supported TQs and TDs, as well as rectifying any omissions, errors, or mistakes that may be discovered both presently and in the future, regardless of COMPANY's review.
)

:*:wfh::working from home

:*:t=::TENDERER

:*:c=::COMPANY

:*:ct=::CONTRACTOR

:*:mcd::McDermott

:*:,asi::
(
    https://spdcsso.assaicloud.com/AWau105/get/details/CRUX/DOCS/
)

::gm::Good morning,

::gf::Good afternoon,

::taq::To answer your question,

; Application specific:
;In Word, Google Chrome, MS Teams, Outlook, or Skype only

#HotIf (WinActive("ahk_class OpusApp") or WinActive("ahk_class rctrl_renwnd32") or WinActive("ahk_class LyncTabFrameHostWindowClass") or WinActive("ahk_class Chrome_WidgetWin_1"))
#Include C:\Apps\misc\ahkscripts\bra.ahk
#HotIf

; In Microsoft Outlook only
;#IfWinActive ahk_class rctrl_renwnd32
#HotIf (WinActive("ahk_class rctrl_renwnd32"))

:*:pfa::please find attached

::s-::--Chetan

::kr::Kind regards,

::mrq::
(
Dear All,

This is a meeting request to discuss 
)

::txe::Thank you for your message.

#HotIf

; symbols
::|1/2::½
::|1/4::¼
::|3/4::¾
::|>=::≥   ;
::|<=::≤
::|!=::≠ ; not equal to

#Include C:\Apps\misc\ahkscripts\todates.ahk

#HotIf (WinActive("ahk_exe OUTLOOK.EXE"))
#Include C:\Apps\misc\ahkscripts\bra.ahk
#HotIf
