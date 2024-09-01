#Requires AutoHotkey v2.0

^!t::  ; Ctrl+Alt+T
{
    workTime := 25 * 60 * 1000  ; 25 minutes in milliseconds
    breakTime := 5 * 60 * 1000  ; 5 minutes in milliseconds
    
    SetTimer(WorkTimer, workTime)
    MsgBox("Pomodoro started. 25 minutes work session begins now.")
    return

    WorkTimer()
    {
        SetTimer(, 0)
        SoundPlay("*-1")
        MsgBox("Work session complete. Take a 5-minute break!")
        SetTimer(BreakTimer, breakTime)
    }

    BreakTimer()
    {
        SetTimer(, 0)
        SoundPlay("*-1")
        if (MsgBox("Break time over. Start another Pomodoro?", "Pomodoro Timer", 4) = "Yes")
            SetTimer(WorkTimer, workTime)
    }
}