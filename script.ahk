#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SendToMCWindow(key) {
    global this_id
    ControlSend, , {%key%}, ahk_id %this_id%
}

MsgBox, "Script loaded."

WinGet, bruh, List, Minecraft

Loop, %bruh% {
    this_id := bruh%A_Index%
    WinActivate, ahk_id %this_id%
    WinGetClass, this_class, ahk_id %this_id%
    WinGetTitle, this_title, ahk_id %this_id%
    MsgBox, 4, "Minecraft Window Finder", "Visiting `n%A_Index% of %bruh%`nahk_id %this_id%`nahk_class %this_class%`n%this_title%`n`nIs this the correct window?"
    IfMsgBox YES
        window_found := true
    If (window_found) {
        break
    }
}

If (!window_found) {
    MsgBox, "No window found. Goodbye."
    return
} Else {
    WinActivate, ahk_id %this_id%
    SetTimer, timer, 4800000
    timer_finished := false

    hotkey, ^n, raid_farm
    return

    reload_script:
    reload
    return

    timer:
    timer_finished := true
    return

    raid_farm:
    MsgBox, "Farm will now run."
    hotkey, ^n, reload_script
    loop {
        SetControlDelay -1
        ControlClick,, ahk_id %this_id%,, RIGHT,, NA D
        sleep, 2500
        SetControlDelay -1
        ControlClick,, ahk_id %this_id%,, RIGHT,, NA U

        SendToMCWindow("d down")
        sleep 1000
        SendToMCWindow("d up")

        SendToMCWindow("s down")
        sleep 1000
        SendToMCWindow("s up")

        SendToMCWindow("a down")
        sleep 1000
        SendToMCWindow("a up")

        SetControlDelay -1
        ControlClick,, ahk_id %this_id%,, RIGHT,, NA
        sleep 500

        SendToMCWindow("w down")
        sleep 1000
        SendToMCWindow("w up")

        SendToMCWindow("d down")
        sleep 500
        SendToMCWindow("d up")

        sleep 4000
        SendToMCWindow("s down}{d down")
        sleep 2000
        SendToMCWindow("s up}{d up")

        sleep 21000
        SendToMCWindow("s down}{a down")
        sleep 3000
        SendToMCWindow("s up}{a up")

        SetControlDelay -1
        ControlClick,, ahk_id %this_id%,, RIGHT,, NA
        sleep 500

        SendToMCWindow("d down")
        sleep 1000
        SendToMCWindow("d up")

        SendToMCWindow("w down")
        sleep 500
        SendToMCWindow("w up")

        loop 37 {
            sleep 1000
            SetControlDelay -1
            ControlClick,, ahk_id %this_id%,,,, NA
        }

        if (timer_finished) {
            SendToMCWindow("Escape")
            SendToMCWindow("Tab")
            SendToMCWindow("Tab")
            SendToMCWindow("Tab")
            SendToMCWindow("Tab")
            SendToMCWindow("Tab")
            SendToMCWindow("Tab")
            SendToMCWindow("Tab")
            SendToMCWindow("Tab")
            SendToMCWindow("Enter")
            MsgBox, "Timer has finished."
            break
        }
    }
    return
}