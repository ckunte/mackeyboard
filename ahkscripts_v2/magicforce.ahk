#Include C:\Apps\misc\ahkscripts\cursor_mac_style.ahk

RControl::RWin

LControl & PgUp::Send "{Volume_Up}"

LControl & PgDn::Send "{Volume_Down}"

PrintScreen::Send "+#{s}"
