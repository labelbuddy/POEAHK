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

F4:: ; Toggle warcrypiano on/off with F4 key
{
    warcrypiano := !warcrypiano ; Flip the warcrypiano state for keypress sequence
    if (warcrypiano)
    {
        ToolTip, WarCryPiano ON
    }
    else
    {
        ToolTip, WarCryPiano OFF
    }
    SetTimer, RemoveToolTip, 3000 ; Remove tooltip after 3 seconds
}
return

q:: ; Trigger WarCryPiano when q is pressed
{
    if (warcrypiano) ; Only execute if warcrypiano is enabled
    {
        Random, rand_delay_q, 50, 150
        Send, q ; Press q (first key in sequence)
        Sleep, %rand_delay_q%

        Random, rand_delay_w, 50, 150
        Send, w ; Press w
        Sleep, %rand_delay_w%

        Random, rand_delay_r, 50, 150
        Send, r ; Press r
        Sleep, %rand_delay_r%

        Random, rand_delay_t, 50, 150
        Send, t ; Press t
        Sleep, %rand_delay_t%

        ToolTip, WarCryPiano Triggered ; Show tooltip indicating WarCryPiano was triggered
        SetTimer, RemoveToolTip, 3000 ; Remove tooltip after 3 seconds
    }
    else
    {
        Send, q ; Allow normal q press if warcrypiano is off
    }
}
return

w:: ; Allow normal w press when warcrypiano is off
{
    if (!warcrypiano)
    {
        Send, w
    }
}
return

r:: ; Allow normal r press when warcrypiano is off
{
    if (!warcrypiano)
    {
        Send, r
    }
}
return

t:: ; Allow normal t press when warcrypiano is off
{
    if (!warcrypiano)
    {
        Send, t
    }
}
return

Space:: ; Spacebar behavior based on spaceToggle state
{
    if (spaceToggle)
    {
        Send {LButton Down} ; Press left mouse button down
        KeyWait Space ; Wait for the release of spacebar
        Send {LButton Up} ; Release left mouse button
    }
    else
    {
        Send {Space} ; Default spacebar behavior when spaceToggle is off
    }
}
return

RemoveToolTip:
ToolTip
return
