!x::{
; Ensure Outlook is running
if !ComObjGet("Outlook.Application")
{
    MsgBox "Outlook is not running. Please open Outlook and try again."
    ExitApp
}

; Get Outlook application object
Outlook := ComObjGet("Outlook.Application")
namespace := Outlook.GetNamespace("MAPI")

; Get the currently selected email
try
{
    selectedItems := Outlook.ActiveExplorer().Selection
    if selectedItems.Count = 0
    {
        MsgBox "No email selected. Please select an email and try again."
        ExitApp
    }
    
    ; Assuming only one item is selected
    email := selectedItems.Item(1)
    
    ; Extract sender's name
    senderName := email.SenderName
    
    ; Create a reply
    reply := email.Reply()
    
    ; Insert salutation into the reply
    reply.HTMLBody := "<p>Dear " . senderName . ",</p>" . reply.HTMLBody
    
    ; Display the reply email
    reply.Display()
}
catch
{
    MsgBox "An error occurred: " . A_ThisFunc
}
}