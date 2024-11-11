#Requires AutoHotkey v2.0

^):: {
    SendEvent "^c" ; presumes text is selected
    cSelected := A_Clipboard ; 
    ClipWait
    Send "(" cSelected ")"
}

;; these below snippets work, but don't need

; :*?:(::{
;     Send "{Raw}()"
;     Send "{Left 1}"
; }
; 
; :*:'::{
;     Send "{Raw}''"
;     Send "{Left 1}"
; }
; 
; :*:"::{
;     Send '{Raw}""'
;     Send '{Left 1}'
; }
;  
; :*?:{::{
;     Send "{Raw}{}"
;     Send "{Left 1}"
; }
;  
; :*?:[::{
;     Send "{Raw}[]"
;     Send "{Left 1}"
; }
