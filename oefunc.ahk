SendMode "Input"
SetTitleMatchMode "RegEx"

; Outlook email processing functions (hat-tip: @sthurston99)

; Fetch current email of selected item (e.g. in Outlook Inbox)
GetCurrEmail()
{
	Return ComObjActive("Outlook.Application").ActiveExplorer.Selection.Item(1)
}
; Get sender's full name of sender from the current email of selected item
GetSender(email)
{
	Return email.SenderName
}
GetCurrSender()
{
	Return GetSender(GetCurrEmail())
}
; Convert a full name into a standard name by removing the middle initial
; if none passed-in, then defaults to sender of current email
GetStdName(name:="")
{
	If(name = "")
	{
		name := GetCurrSender()
	}
	Return RegExReplace(name,"\w\. ")
}
; Extract the first name from a standard name
; if none, defaults to sender of current email
GetFirstName(name:="")
{
	If(name = "")
	{
		name := GetStdName()
	}
	Return RegExReplace(name,"\s.*")
}
; Return a random boilerplate email greeting
GenGreeting()
{
	greeting := ["", "Hi", "Hello", "Good $time"]
	hour := FormatTime(, "H")
	If (hour >= 4) and (hour < 12)
	{
		timestr := "morning"
	}
	Else If (hour >= 12) and (hour < 18)
	{
		timestr := "afternoon"
	}
	Else
	{
		timestr := "day"
	}
	idx := Random(1, greeting.Length)
	greet := greeting[idx]
	If (greet != "")
	{
		greet := greet . " "
	}
	Return StrReplace(greet, "$time", timestr)
}

; Outlook hotkey(s)
#HotIf (WinActive("ahk_exe OUTLOOK.EXE")
{
	; generate a reply and autofill with a standard greeting
	^r::
	{
		GetCurrEmail().ReplyAll.Display
		WinWaitActive("RE: ")
		Send "!has2{Down4}{Enter}{Up 2}"
		Send(GenGreeting() . GetFirstName() . ",")
		Send "{Enter 2}"
		Return
	}
}