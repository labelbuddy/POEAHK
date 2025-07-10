# 🐍 I hate my yellow Beast v1.0

An AutoHotkey script to automate beast crafting interactions in **Path of Exile** with realistic mouse movement and randomized delays.  
Designed for players who are tired of yellow beast micromanagement — and those with wrist strain or RSI.

> ⚠️ Use at your own risk. This script performs multiple actions per key press and may violate the Path of Exile Terms of Service.  
> Intended for accessibility and quality-of-life purposes.

---

## 💡 Features

- **CapsLock Toggle Behavior**:
  - Press `1` normally → Sends key `1`
  - Press `1` while CapsLock is **ON** → Automates the beast crafting sequence:
    1. Right-click **Beast Orb**
    2. Left-click **Beast**
    3. Left-click **Drop Slot**

- **Smooth Human-Like Input**:
  - Realistic `MouseMove` speed
  - Randomized delays between steps
  - Position restore not needed — script stays efficient and simple

- **Configurable Positions via Hotkeys**:
  | Hotkey     | Action                        |
  |------------|-------------------------------|
  | `Shift + F9`  | Save Beast Orb position       |
  | `Shift + F10` | Save Beast position           |
  | `Shift + F11` | Save Drop position            |

- **Config Stored in INI File**:
  - Saves coordinates in `Config.ini` alongside the script

---

## 📁 Installation

1. [Install AutoHotkey](https://www.autohotkey.com/)
2. Save this script as `yellowBeast.ahk`
3. Launch Path of Exile
4. Run the script
5. Use `Shift + F9/F10/F11` to map positions

---

## ⚙️ Advanced Config

You can tweak these values in the script for faster/slower behavior:

```ahk
vClickDelaySpeedMin := 5
vClickDelaySpeedMax := 10
vMouseMoveSpeed := 5
vStepDelayMin := 20
vStepDelayMax := 50
```

---

## 🔒 Disclaimer

This script is intended for accessibility and quality-of-life purposes only.  
You are responsible for your own account — use responsibly.

---

## 🧼 Future Improvements (optional ideas)

- Config reset hotkey
- Random click offset
- Debug overlay to show saved coordinates
- Mode toggle between "fast" and "realistic"

---

🛠️ Made with love and a little hatred for yellow beasts.
