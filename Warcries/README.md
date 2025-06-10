
# AutoHotkey Script - Warcry Sequence and Button Toggle

## Overview

This AutoHotkey (AHK) script automates a sequence of key presses (Q, W, R, T) in **Path of Exile** (PoE), allowing players to toggle and customize actions for warcry abilities. It includes three main toggles to control different features of the sequence, providing a flexible and automated experience. This script is designed to run only when **Path of Exile** is the active window.

### Features
- **Warcry Sequence**: Automates a key press sequence for abilities (Q, W, R, T) with adjustable delays.
- **Warcry Toggle Options**: Allows toggling different modes with F1, F2, and F3 keys to customize automation:
  - **F1**: Toggles the Warcry Sequence mode.
  - **F2**: Toggles one button warcries
  - **F3**: Toggles continuous Warcry button presses with a random delay between each key press.
- **Randomized Delays**: Random delays between key presses to simulate human input.

### Key Features Summary:
- **F1**: Toggles warcry sequence mode (activates the Q, W, R, T sequence) Allows you to press any button (Q, W, R, T) in any order, and will always cast in the sequence (Q, W, R, T).
- **F2**: Toggles a one-time button press (Q, W, R, T) with randomized delays.
- **F3**: Toggles continuous auto Warcry press with randomized delays between Q, W, R, T.

## Hotkeys and Functionality

### F1: **Toggle Warcry Sequence**
- When activated, the **warcryseq** mode is enabled.
- The script will cycle through the keys **Q → W → R → T** in sequence, with a reset every 5.5 seconds.
- The tooltip "warcryseq ON" will be displayed when enabled.

### F2: **Toggle One-Time Warcry Button**
- When activated, the **warcry1button** mode is enabled.
- The **Q → W → R → T** sequence will be triggered when **Q** is pressed with randomized delays.
- The tooltip "warcry1button ON" will be displayed when enabled.

### F3: **Toggle Auto Warcry Sequence**
- When activated, the **warcryauto** mode is enabled.
- The script will continuously press **Q → W → R → T** with randomized delays between each press.
- The tooltip "warcryauto ON" will be displayed when enabled.

### Key Presses:
- **Q, W, R, T**: These keys are used to control the Warcry sequence. They are intercepted and trigger the corresponding action based on the active toggle.
  - If **warcryseq** is enabled, the script will follow the **Q → W → R → T** sequence.
  - If **warcry1button** is enabled, the sequence will be triggered manually by pressing **Q**, and it will automatically proceed to **W, R, T** with delays.
  - If **warcryauto** is enabled, the sequence will execute automatically with random delays between each key press.

### Sequence Reset:
- The sequence is reset back to **Q** after 5.5 seconds if **warcryseq** is enabled, ensuring a fresh start each time the sequence is triggered.

## How to Use

1. **Activate the Script**: 
   - Ensure **Path of Exile** is the active window.
   - Run the script using AutoHotkey.

2. **Use the Hotkeys**:
   - **F1**: Toggle warcry sequence.
   - **F2**: Toggle one-time warcry button press with delays.
   - **F3**: Toggle continuous Warcry with random delays.

3. **Key Presses**:
   - Press **Q**, **W**, **R**, or **T** to trigger the corresponding actions based on the mode that is active.

4. **View Tooltips**:
   - Tooltips will display the current toggle state (e.g., "warcryseq ON", "warcry1button ON").
   - Tooltips will automatically disappear after 3 seconds.

## Customization

- **Random Delay Range**: The script uses random delays between 50ms and 150ms for each key press. You can adjust this range by changing the `Random, rand_delay_*` values for each key.
- **Sequence Duration**: The **warcryseq** mode has a 5.5-second duration for the sequence, after which it resets. Adjust this by modifying the `SetTimer, SequenceResetTimer, 5500` line to your preferred value.
