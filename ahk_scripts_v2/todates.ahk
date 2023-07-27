; task done for to-do lists (AHK v2)

:c*:,ds::{
;    currdatetime:= FormatTime("A_Now", "yyyy-M-d HH:mm")
;    Send "@done(" currdatetime ")"
    Year := SubStr(A_YWeek, 1, 4)
    Week := SubStr(A_YWeek, -2)
    Send "@done(" Year "W" Week ")"
}
 
:c*:ds::{
    currdatetime:= FormatTime("A_Now", "yyyy-M-d")
    Send currdatetime
}

:c*:,dw::{
    Year := SubStr(A_YWeek, 1, 4)
    Week := SubStr(A_YWeek, -2)
    Send Year "W" Week    
}

:c*:,rck::{
;    currdatetime:= FormatTime("A_Now", "yyyy-M-d HH:mm")
;    Send "Reviewed and acknowledged. (" currdatetime ")" 
    Year := SubStr(A_YWeek, 1, 4)
    Week := SubStr(A_YWeek, -2)
    Send "Reviewed and acknowledged. (" Year "W" Week ")"
}

:c*:,rsp::{
;    currdatetime:= FormatTime("A_Now", "yyyy-M-d HH:mm")
;    Send "Reviewed and supported. (" currdatetime ")" 
    Year := SubStr(A_YWeek, 1, 4)
    Week := SubStr(A_YWeek, -2)
    Send "Reviewed and supported. (" Year "W" Week ")"
}
