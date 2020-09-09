/*
[script info]
version     = 2.5
description = wrap selected text in %symbols%
author      = davebrny
source      = https://gist.github.com/davebrny/088c48d6678617876b34f53571e92ee6
*/

sendMode input
return ; end of auto-execute
;---------------------------


!"::
::w2::
goTo, wrap_quote        ;   "text"

!'::
::w'::
goTo, wrap_apostrophe   ;   'text'

!9::
::w9::
goTo, wrap_parenthesis  ;   (text)

![::
::w[::
goTo, wrap_bracket      ;   [text]

!del::
::wdel::
goTo, wrap_delete       ;   _text_  --->  text




;-----------------------




wrap_quote:
wrap_apostrophe:
wrap_parenthesis:
wrap_bracket:
this_label := a_thisLabel
clipboard_text := get_clipboard()
for what, with in { "wrap_quote"       : """" clipboard_text """"
                  , "wrap_apostrophe"  :  "'" clipboard_text "'"
                  , "wrap_parenthesis" :  "(" clipboard_text ")"
                  , "wrap_bracket"     :  "[" clipboard_text "]" }
    stringReplace, this_label, this_label, % what, % with, all
new_text := this_label
goSub, send_wrap
return



wrap_delete:
clipboard_text := get_clipboard()
loop, 2
    {
    stringLeft, left_character, clipboard_text, 1
    stringRight, right_character, clipboard_text, 1
    if regExMatch(left_character, "[\Q'%*-_""~``([{><\E]")
        and if regExMatch(right_character, "[\Q'%*-_""~)``]}><\E]")  ; if  '%*-_"~`([{
        {
        stringTrimLeft, clipboard_text, clipboard_text, 1
        stringTrimRight, clipboard_text, clipboard_text, 1
        }
    else break
    }
new_text := clipboard_text
goSub, send_wrap
return



get_clipboard(){
    global
    if !inStr(a_thisHotkey, ":")    ; if hotkey was used
        {
        revert_clipboard := clipboardAll
        clipboard =
        send ^{c}
        clipWait, 0.3
        if clipboard is space
            clipboard =
        }

    return clipboard
}



send_wrap:
if !inStr(a_thisHotkey, ":") and if (clipboard = "")       ; if hotkey was used
     position := "{Left " round( strLen(new_text) / 2) "}" ; move cursor between symbols
else position := ""
clipboard := new_text
send % "^{v}" . position
sleep 150
clipboard := revert_clipboard
return