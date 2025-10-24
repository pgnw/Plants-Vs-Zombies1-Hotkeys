#Requires AutoHotkey v2.0
#SingleInstance Force

CoordMode("mouse", "Screen")

INPUT_MOUSE := 0

MOUSEEVENTF_MOVE := 0x0001
MOUSEEVENTF_ABSOLUTE := 0x8000
MOUSEEVENTF_LEFTDOWN := 0x0002
MOUSEEVENTF_LEFTUP := 0x0004

screenW := A_ScreenWidth
screenH := A_ScreenHeight

ClickAndReturn(x, y) {
    MouseGetPos &oldX, &oldY

    Move(x, y, true)
    Move(oldX, oldY, false)
}

Move(x, y, click := false) {

    inputs := Buffer(40, 0)

    NumPut("UInt", INPUT_MOUSE, inputs, 0)

    NumPut("Int", convertCord(x, A_ScreenWidth), inputs, 8)
    NumPut("Int", convertCord(y, A_ScreenHeight), inputs, 12)
    NumPut("UInt", 0, inputs, 16)
    if (click) {
        NumPut("UInt", MOUSEEVENTF_MOVE | MOUSEEVENTF_LEFTDOWN | MOUSEEVENTF_ABSOLUTE, inputs, 20)
    }
    else {
        NumPut("UInt", MOUSEEVENTF_MOVE | MOUSEEVENTF_ABSOLUTE, inputs, 20)
    }
    NumPut("UInt", 0, inputs, 24)
    NumPut("Ptr", 0, inputs, 32)

    DllCall("user32.dll\SendInput"
        , "UInt", 1
        , "Ptr", inputs
        , "Int", 40
    )
}

convertCord(num, maxScreen) {
    return Round(num * (65535 / (maxScreen - 1)))
}

#HotIf WinActive("ahk_exe PlantsVsZombiesRH.exe")
1:: ClickAndReturn(441, 79)
2:: ClickAndReturn(538, 77)
3:: ClickAndReturn(628, 81)
4:: ClickAndReturn(721, 79)
5:: ClickAndReturn(760, 77)
6:: ClickAndReturn(828, 81)
7:: ClickAndReturn(880, 79)
8:: ClickAndReturn(940, 77)
9:: ClickAndReturn(1000, 81)
0:: ClickAndReturn(1060, 81)

q:: ClickAndReturn(153, 913)
z:: ClickAndReturn(1626, 86)

#HotIf