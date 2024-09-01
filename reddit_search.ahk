#Requires AutoHotkey v2.0

^!r:: {  ; Ctrl+Alt+R
    searchTerm := InputBox("Enter search term:", "Reddit Search")
    if searchTerm.Result == "OK" {
        Run("https://www.google.com/search?q=site:reddit.com+" UrlEncode(searchTerm.Value))
    }
}

UrlEncode(str) {
    replacements := [["\", "%5C"], ["&", "%26"], [" ", "+"]]
    for each, pair in replacements
        str := StrReplace(str, pair[1], pair[2])
    return str
}
