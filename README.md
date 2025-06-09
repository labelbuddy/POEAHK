
# AHK Script for Path of Exile - WarCryPiano, FlaskFinder, and more

## Overview
This AutoHotkey (AHK) script is designed for **Path of Exile (POE)** players. It provides automation features such as flask macros, spacebar movement toggles, and warcry sequence automation. Each function can be toggled on or off with specific hotkeys for ease of use while playing the game.

## Functions

### 1. **fmtoggle (Flask Macro)** - **F1**
   - **Purpose**: Toggles a button sequence that presses keys **1, 2, 3, 4, 5** with random delays.
   - **Hotkey**: **F1**
   - **How it works**: When enabled, the script simulates the keypresses of 1, 2, 3, 4, and 5 with randomized delays between them. The feature is intended for use in **FlaskFinder** or any similar functionality.
   - **Tooltip**: Displays "Flask Macro ON" when active and "Flask Macro OFF" when disabled.

### 2. **spaceToggle (Space barmovement)** - **F2**
   - **Purpose**: Toggles the action of the spacebar to either trigger space press or simulate left-click mouse button.
   - **Hotkey**: **F2**
   - **How it works**: When enabled, pressing the spacebar will simulate a mouse click (left button) as long as the spacebar is held down. When disabled, it works as a normal spacebar press.

### 3. **lifetoggle (FlaskFinder)** - **F3**
   - **Purpose**: Toggles the **FlaskFinder** functionality by repeatedly pressing **1** (or any key) with a randomized delay.
   - **Hotkey**: **F3**
   - **How it works**: When enabled, it starts a timer that simulates pressing key **1** with a random delay between **47ms** and **115ms**. This is primarily intended for flask usage in **Path of Exile**.
   - **Tooltip**: Displays "Pathfinder flask on" when active and "Pathfinder flask off" when disabled.

### 4. **warcrypiano (War Cry Sequence)** - **F4**
   - **Purpose**: Toggles the ability to trigger a sequence of key presses (**q, e, r, t**) with random delays between them.
   - **Hotkey**: **F4**
   - **How it works**: When toggled **on**, pressing **q** triggers the sequence of **q, e, r, t** with random delays between **50ms** and **150ms** for each key press.
   - **Tooltip**: Displays "WarCryPiano ON" when enabled and "WarCryPiano OFF" when disabled.

## How to Use the Script
1. Download and install [AutoHotkey](https://www.autohotkey.com/).
2. Copy the script into a `.ahk` file (e.g., `POE_Script.ahk`).
3. Double-click the `.ahk` file to run the script.
4. Open **Path of Exile** (POE) and use the following hotkeys:
   - **F1**: Toggle **Flask Macro** (key presses 1, 2, 3, 4, 5 with delays).
   - **F2**: Toggle **Space Action** (spacebar as mouse click or normal).
   - **F3**: Toggle **FlaskFinder** (repeated key press with random delay).
   - **F4**: Toggle **WarCryPiano** (sequence triggered by **q**).
   - **q**: Trigger the **WarCryPiano** sequence.

## Notes
- The script is designed to work when **Path of Exile** is the active window, as specified by the `#IfWinActive, ahk_class POEWindowClass`.
- Adjust the key sequences and random delay ranges in the script as needed for your personal preferences.
- The tooltips will show you the current status of the toggles, and they automatically disappear after a few seconds.
