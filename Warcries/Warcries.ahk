; This line makes the script only work when Path of Exile is the active window
#IfWinActive, ahk_class POEWindowClass

warcry1button := false ; Initialize the warcry1button state
warcryseq := false ; Initialize the warcryseq state
warcryauto := false ; Initialize the warcryauto state
castSequence := ["q", "w", "r", "t"] ; Sequence of keys to press
currentIndex := 1 ; Start with the first key in the sequence

F1:: ; Toggle warcryseq on/off with F1 key
{
    warcryseq := !warcryseq ; Flip the warcryseq state
    if (warcryseq)
    {
        ToolTip, warcryseq ON
        SetTimer, SequenceResetTimer, 5500 ; Reset the sequence every 5.5 seconds
    }
    else
    {
        ToolTip, warcryseq OFF
        SetTimer, SequenceResetTimer, Off ; Turn off the timer when toggled off
    }
    SetTimer, RemoveToolTip, 3000 ; Remove tooltip after 3 seconds
}
return

F2:: ; Toggle warcry1button on/off with F2 key
{
    warcry1button := !warcry1button ; Flip the warcry1button state for keypress sequence
    if (warcry1button)
    {
        ToolTip, warcry1button ON
    }
    else
    {
        ToolTip, warcry1button OFF
    }
    SetTimer, RemoveToolTip, 3000 ; Remove tooltip after 3 seconds
}
return

F3:: ; Toggle warcryauto on/off with F4 key
{
    warcryauto := !warcryauto ; Flip the warcryauto state
    if (warcryauto)
    {
        ToolTip, warcryauto ON
        SetTimer, WarCryAutoSequence, 5500 ; Modify duration here (currently 5.5 seconds)
    }
    else
    {
        ToolTip, warcryauto OFF
        SetTimer, WarCryAutoSequence, Off ; Turn off the timer when toggled off
    }
    SetTimer, RemoveToolTip, 3000 ; Remove tooltip after 3 seconds
}
return

WarCryAutoSequence: ; Automatically execute WarCry sequence (Q, W, R, T) with random delays
{
    Random, rand_delay_q, 450, 550
    Send, q ; Press q
    Sleep, %rand_delay_q%

    Random, rand_delay_w, 450, 550
    Send, w ; Press w
    Sleep, %rand_delay_w%

    Random, rand_delay_r, 450, 550
    Send, r ; Press r
    Sleep, %rand_delay_r%

    Random, rand_delay_t, 450, 550
    Send, t ; Press t
    Sleep, %rand_delay_t%
}
return

#If (warcryseq or warcry1button or warcryauto) ; Only intercept the Q, W, R, T keys if any section is active

q:: ; Handle Q for both warcryseq, warcry1button, and warcryauto
{
    if (warcryseq) ; If warcryseq is enabled
    {
        Send, % castSequence[currentIndex] ; Send the current key in the sequence
        currentIndex := currentIndex + 1 ; Move to the next button in the sequence

        if (currentIndex > 4) ; If we reach the end of the sequence, reset to Q
            currentIndex := 1
    }
    else if (warcry1button) ; If warcry1button is enabled
    {
        Random, rand_delay_q, 450, 550
        Send, q ; Press q (first key in sequence)
        Sleep, %rand_delay_q%

        Random, rand_delay_w, 450, 550
        Send, w ; Press w
        Sleep, %rand_delay_w%

        Random, rand_delay_r, 450, 550
        Send, r ; Press r
        Sleep, %rand_delay_r%

        Random, rand_delay_t, 450, 550
        Send, t ; Press t
        Sleep, %rand_delay_t%

        ToolTip, warcry1button Triggered ; Show tooltip indicating warcry1button was triggered
        SetTimer, RemoveToolTip, 3000 ; Remove tooltip after 3 seconds
    }
}
return

w:: ; Press W to trigger the current button in the sequence
{
    if (warcryseq)
    {
        Send, % castSequence[currentIndex] ; Send the current key in the sequence
        currentIndex := currentIndex + 1 ; Move to the next button in the sequence

        if (currentIndex > 4) ; If we reach the end of the sequence, reset to Q
            currentIndex := 1
    }
}
return

r:: ; Press R to trigger the current button in the sequence
{
    if (warcryseq)
    {
        Send, % castSequence[currentIndex] ; Send the current key in the sequence
        currentIndex := currentIndex + 1 ; Move to the next button in the sequence

        if (currentIndex > 4) ; If we reach the end of the sequence, reset to Q
            currentIndex := 1
    }
}
return

t:: ; Press T to trigger the current button in the sequence
{
    if (warcryseq)
    {
        Send, % castSequence[currentIndex] ; Send the current key in the sequence
        currentIndex := currentIndex + 1 ; Move to the next button in the sequence

        if (currentIndex > 4) ; If we reach the end of the sequence, reset to Q
            currentIndex := 1
    }
}
return

SequenceResetTimer: ; Reset the sequence back to Q after 5.5 seconds
{
    currentIndex := 1 ; Reset to the first button in the sequence (Q)
}
return

RemoveToolTip:
ToolTip
return
