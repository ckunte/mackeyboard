; Function to create a new email reply
ReplyToSelectedEmail()
{
    ; Get the Outlook application and active explorer
    ObjOutlook := ComObjActive("Outlook.Application")
    ObjExplorer := ObjOutlook.ActiveExplorer()

    ; Check if there's any selected item
    If (ObjExplorer.Selection.Count = 0)
    {
        MsgBox "No email selected."
        return
    }

    ; Get the selected email
    ObjItem := ObjExplorer.Selection.Item(1) ; Assumes the first selected email is the one to reply to

    ; Reply to the selected email
    ObjMail := ObjItem.Reply()

    ; Extract the sender's full name
    SenderFullName := ObjItem.SenderName

    ; Split the sender's name into parts and take the first name
    SenderNameParts := StrSplit(SenderFullName, " ")
    SenderFirstName := SenderNameParts[1]

    ; Customize the reply subject and body
    ObjMail.Subject := "Re: " . ObjItem.Subject
    ObjMail.Body := "Dear " . SenderFirstName . "," . "`r`n`r`n" . "Thank you for your message." . "`r`n" . ObjMail.Body

    ; Display the reply
    ObjMail.Display()
}

; Hotkey to trigger the function
; Replace "Alt + x" with your desired hotkey if needed
!x::
{
    ReplyToSelectedEmail()
}
return
