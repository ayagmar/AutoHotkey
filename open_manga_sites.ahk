#Requires AutoHotkey v2.0
#SingleInstance Force

; List of manga websites
sites := [
    "https://asuracomic.net/",
    "https://reaperscans.com/comics",
    "https://flamecomics.me/",
    "https://manga4life.com/"
]

Run("firefox.exe -new-window " . sites[1])

Sleep(500)

; Open the rest of the sites in new tabs
for i, site in sites {
    if (i > 1) {
        Run("firefox.exe -new-tab " . site)
        Sleep(100) 
    }
}


MsgBox("All manga sites have been opened in a single Firefox window!")

; Exit the script
ExitApp()