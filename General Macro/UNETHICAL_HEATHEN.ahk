; This line makes the script only work when Path of Exile is the active window
#IfWinActive, ahk_class POEWindowClass

fmtoggle := false ; Initialize the fmtoggle state for button sequence
spaceToggle := false ; Initialize the toggle state for space action
lifetoggle := false ; Initialize the lifetoggle state for Flaskfinder functionality
warcrypiano := false ; Initialize the warcrypiano state

XButton1:: ; "Back"-Button on my mouse
{
    if (fmtoggle) ; Only run if fmtoggle is true
    {
        ; Initialize random delays between 57 and 114 ms (arbitrary values, can be changed)
        random, delay2, 57, 114
        random, delay3, 57, 114
        random, delay4, 57, 114
        random, delay5, 57, 114

        ; Press 1, 2, 3, 4, 5 with random delays
        sleep, %delay2%
        send, 1 ; Simulates the keypress of the 1 button

        sleep, %delay3%
        send, 2 ; Simulates the keypress of the 2 button

        sleep, %delay4%
        send, 3 ; Simulates the keypress of the 3 button

        sleep, %delay5%
        send, 4 ; Simulates the keypress of the 4 button

        ; Optional: Add more delays or key presses as needed
        sleep, 50
        send, 5 ; Simulates the keypress of the 5 button
    }
}
return

F1:: ; Toggle fmtoggle on/off with F1 key
{
    fmtoggle := !fmtoggle ; Flip the fmtoggle state for button sequence
    if (fmtoggle)
    {
        ToolTip, Flask Macro ON
    }
    else
    {
        ToolTip, Flask Macro OFF
    }
    SetTimer, RemoveToolTip, -1000 ; Remove tooltip after 1 second
}
return

F2:: ; Toggle space action on/off with F2 key
{
    spaceToggle := !spaceToggle ; Flip the toggle state for space action
    if (spaceToggle)
    {
        ToolTip, Space Action Enabled
    }
    else
    {
        ToolTip, Space Action Disabled
    }
    SetTimer, RemoveToolTip, -1000 ; Remove tooltip after 1 second
}
return

F3:: ; Toggle lifetoggle on/off with F3 key for Flaskfinder
{
    lifetoggle := !lifetoggle ; Flip the lifetoggle state for Flaskfinder functionality
    if (lifetoggle)
    {
        SetTimer, PressKeyLoop, 5200 ; Change duration here
        ToolTip, Pathfinder flask on
    }
    else
    {
        SetTimer, PressKeyLoop, Off
        ToolTip, Pathfinder flask off
    }
    SetTimer, RemoveToolTip, 3000 ; Remove tooltip after 3 seconds
}
return

PressKeyLoop: ; Flaskfinder key press loop
{
    if (lifetoggle)
    {
        Random, rand_delay, 47, 115
        Send, 1 ; Simulates the keypress of the 1 button (or whichever key you'd prefer)
        Sleep, %rand_delay%
    }
}
return


#If (spaceToggle && WinActive("ahk_class POEWindowClass"))
Space::
{
    if (!GetKeyState("LButton"))
    {
        Click down
    }
}
return

Space Up::
Click up
return
#If

return

RemoveToolTip:
ToolTip
return
