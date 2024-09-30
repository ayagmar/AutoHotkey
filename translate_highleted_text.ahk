#Requires AutoHotkey v2.0

^!t::  ; Ctrl+Alt+T hotkey
{
    ; Preserve the current clipboard content
    oldClipboard := ClipboardAll()
    
    ; Empty the clipboard
    A_Clipboard := ""
    
    ; Send Ctrl+C to copy the selected text
    Send "^c"
    
    ; Wait for the clipboard to contain text
    if !ClipWait(2)
    {
        MsgBox("Failed to copy text to clipboard")
        return
    }
    
    ; Get the selected text from the clipboard
    selectedText := A_Clipboard
    
    ; URL encode the selected text
    encodedText := UrlEncode(selectedText)
    
    ; Construct the Google Translate URL
    url := "https://translate.google.com/?text=" . encodedText
    
    ; Open the URL in the default browser
    Run url
    
    ; Restore the original clipboard content
    A_Clipboard := oldClipboard
}

UrlEncode(str) {
    encodedStr := ""
    for i, char in StrSplit(str) {
        if char ~= "[a-zA-Z0-9-_.~]"
            encodedStr .= char
        else
            encodedStr .= "%" . Format("{:02X}", Ord(char))
    }
    return encodedStr
}