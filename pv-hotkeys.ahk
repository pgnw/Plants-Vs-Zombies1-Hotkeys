#Requires AutoHotkey v2.0
#SingleInstance Force

CoordMode("mouse", "Screen")

INPUT_MOUSE := 0

MOUSEEVENTF_MOVE := 0x0001
MOUSEEVENTF_ABSOLUTE := 0x8000
MOUSEEVENTF_LEFTDOWN := 0x0002
MOUSEEVENTF_LEFTUP := 0x0004
MOUSEEVENTF_RIGHTDOWN := 0x0008
MOUSEEVENTF_RIGHTUP := 0x0010

screenW := A_ScreenWidth
screenH := A_ScreenHeight

ClickAndReturn(x, y) {
    local oldx, oldy
    MouseGetPos &oldx, &oldy

    Sleep(1)
    MouseMove(oldx, oldy)
    Sleep(1)
    Click("Right")
    Sleep(1)
    MouseMove(x, y)
    Sleep(1)
    Click("Left")
    Sleep(1)
    MouseMove(oldx, oldy)

    /*
    RightClick(true)
    RightClick(false)
    
    Sleep(3)
    DllCall("SetCursorPos", "int", x, "int", y)
    sleep(3)
    Click(true)
    Click(false)
    Sleep(2)
    DllCall("SetCursorPos", "int", oldx, "int", oldy)
    */
}

Clicka(sendDown := true) {
    inputs := Buffer(40, 0)

    NumPut("UInt", INPUT_MOUSE, inputs, 0)

    NumPut("Int", 0, inputs, 8)
    NumPut("Int", 0, inputs, 12)
    NumPut("UInt", 0, inputs, 16)

    if (sendDown) {
        NumPut("UInt", MOUSEEVENTF_LEFTDOWN, inputs, 20)
    }
    else {
        NumPut("UInt", MOUSEEVENTF_LEFTUP, inputs, 20)
    }

    NumPut("UInt", 0, inputs, 24)
    NumPut("Ptr", 0, inputs, 32)

    DllCall("user32.dll\SendInput"
        , "UInt", 1
        , "Ptr", inputs
        , "Int", 40
    )
}

RightClick(sendDown := true) {
    inputs := Buffer(40, 0)

    NumPut("UInt", INPUT_MOUSE, inputs, 0)

    NumPut("Int", 0, inputs, 8)
    NumPut("Int", 0, inputs, 12)
    NumPut("UInt", 0, inputs, 16)

    if (sendDown) {
        NumPut("UInt", MOUSEEVENTF_RIGHTDOWN, inputs, 20)
    }
    else {
        NumPut("UInt", MOUSEEVENTF_RIGHTUP, inputs, 20)
    }

    NumPut("UInt", 0, inputs, 24)
    NumPut("Ptr", 0, inputs, 32)

    DllCall("user32.dll\SendInput"
        , "UInt", 1
        , "Ptr", inputs
        , "Int", 40
    )
}

#HotIf WinActive("ahk_exe PlantsVsZombiesRH.exe")
1:: ClickAndReturn(441, 79)
2:: ClickAndReturn(538, 77)
3:: ClickAndReturn(628, 81)
4:: ClickAndReturn(721, 79)
5:: ClickAndReturn(760, 77)
6:: ClickAndReturn(828, 81)
7:: ClickAndReturn(900, 79)
8:: ClickAndReturn(940, 77)
9:: ClickAndReturn(1000, 81)
0:: ClickAndReturn(1060, 81)

q:: ClickAndReturn(160, 913)
z:: ClickAndReturn(1626, 86)
e:: ClickAndReturn(1710, 86)
#HotIf