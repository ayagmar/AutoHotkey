#Requires AutoHotkey v2.0

GeneratePassword()
{
    alphanumeric := "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    special_chars := "!@#$%^&*()_+-=[]{}|;:,.<>?"
    password := ""
    
    ; Generate 15 alphanumeric characters
    Loop 15 {
        random_index := Random(1, StrLen(alphanumeric))
        password .= SubStr(alphanumeric, random_index, 1)
    }
    
    ; Add one special character at a random position
    special_char := SubStr(special_chars, Random(1, StrLen(special_chars)), 1)
    insert_position := Random(1, 16)
    password := SubStr(password, 1, insert_position - 1) . special_char . SubStr(password, insert_position)
    
    return password
}

^!p::  ; Ctrl+Alt+P hotkey
{
    password := GeneratePassword()
    A_Clipboard := password
    ToolTip("Password generated and copied to clipboard!")
    SetTimer () => ToolTip(), -2000  ; Remove the tooltip after 2 seconds
}