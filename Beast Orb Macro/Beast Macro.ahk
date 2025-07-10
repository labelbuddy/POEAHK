; ##########################################
; # I hate my yellow Beast v 1.0           #
; ##########################################
#IfWinActive  Path of Exile
#NoEnv 
#SingleInstance , Force
SetWorkingDir %A_ScriptDir% 
SendMode, Input
ConfigINI=%A_scriptdir%\Config.ini
ifnotexist,%ConfigINI%
{
    IniWrite, 0    , %ConfigINI%, BeastorbPos, xx
    IniWrite, 0    , %ConfigINI%, BeastorbPos, yy
    IniWrite, 0    , %ConfigINI%, BeastPos, xx
    IniWrite, 0    , %ConfigINI%, BeastPos, yy
    IniWrite, 0    , %ConfigINI%, DropPos, xx
    IniWrite, 0    , %ConfigINI%, DropPos, yy
}
;=Realistic speed adjustments=
vClickDelaySpeedMin := 5
vClickDelaySpeedMax := 10
vMouseMoveSpeed := 5 ; Lower = slower/smoother movement
vStepDelayMin := 20
vStepDelayMax := 50

$1::
if !GetKeyState("capslock", "T")
{
    Send, 1
}
else
{
    BlockInput, MouseMove

    ; Read all coordinates
    IniRead, orbX, %ConfigINI%, BeastorbPos, xx
    IniRead, orbY, %ConfigINI%, BeastorbPos, yy
    IniRead, beastX, %ConfigINI%, BeastPos, xx
    IniRead, beastY, %ConfigINI%, BeastPos, yy
    IniRead, dropX, %ConfigINI%, DropPos, xx
    IniRead, dropY, %ConfigINI%, DropPos, yy

    ; Step 1: Beast Orb
    MouseMove, orbX, orbY, vMouseMoveSpeed
    Random, clickDelay1, %vClickDelaySpeedMin%, %vClickDelaySpeedMax%
    Sleep, %clickDelay1%
    MouseClick, right
    Random, stepDelay1, %vStepDelayMin%, %vStepDelayMax%
    Sleep, %stepDelay1%

    ; Step 2: Beast
    MouseMove, beastX, beastY, vMouseMoveSpeed
    Random, clickDelay2, %vClickDelaySpeedMin%, %vClickDelaySpeedMax%
    Sleep, %clickDelay2%
    MouseClick, left
    Random, stepDelay2, %vStepDelayMin%, %vStepDelayMax%
    Sleep, %stepDelay2%

    ; Step 3: Drop
    MouseMove, dropX, dropY, vMouseMoveSpeed
    Random, clickDelay3, %vClickDelaySpeedMin%, %vClickDelaySpeedMax%
    Sleep, %clickDelay3%
    MouseClick, left

    BlockInput, MouseMoveOff
}
return

+F9:: ;Beast Orb Position
    MouseGetPos xx, yy
    IniWrite, %xx%, %ConfigINI%, BeastorbPos, xx
    IniWrite, %yy%, %ConfigINI%, BeastorbPos, yy
    Tooltip, Beast Orb Pos Saved: %xx%, %yy%
    SetTimer, RemoveToolTip, -1500
return

+F10:: ;Beast Position
    MouseGetPos xx, yy
    IniWrite, %xx%, %ConfigINI%, BeastPos, xx
    IniWrite, %yy%, %ConfigINI%, BeastPos, yy
    Tooltip, Beast Pos Saved: %xx%, %yy%
    SetTimer, RemoveToolTip, -1500
return

+F11:: ;Drop Position
    MouseGetPos xx, yy
    IniWrite, %xx%, %ConfigINI%, DropPos, xx
    IniWrite, %yy%, %ConfigINI%, DropPos, yy
    Tooltip, Drop Pos Saved: %xx%, %yy%
    SetTimer, RemoveToolTip, -1500
return

RemoveToolTip:
    ToolTip
return