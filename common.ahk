global SUI_CURRENT_IM := 0

IME_SET(setSts, WinTitle="")
{
  SUI_CURRENT_IM := setSts
  ifEqual WinTitle,,  SetEnv, WinTitle, A
  WinGet, hWnd, ID, %WinTitle%
  DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint, hWnd, Uint)

  DetectSave := A_DetectHiddenWindows
  DetectHiddenWindows, ON
  SendMessage 0x283, 0x006, setSts,, ahk_id %DefaultIMEWnd%
  DetectHiddenWindows, %DetectSave%
  Return ErrorLevel
}

; copy interface in window manager
GetWindowInfo(hwnd) {
  WinGetTitle, title, ahk_id %hwnd%
  WinGetClass, class, ahk_id %hwnd%
  WinGet, processPath, ProcessPath, ahk_id %hwnd%
  WinGet, processName, ProcessName, ahk_id %hwnd%
  WinGetPos, x, y, width, height, ahk_id %hwnd%
  info = windtitle:%title%`nwindclass:%class%`nwindpos:%x%, %y%`nwindsize:%width%x%height%`nwindprocess:%processName%`nwindprocesspath:%processPath%
  Clipboard := info
}

~LShift up::
  if(GetKeyState(";")) {
    return
  }
  if (GetKeyState("CapsLock", "T")) {
    SetCapsLockState, Off
  }
  if (WinExist("ahk_class SoPY_Comp")){
    Send {Enter}
  }
  IME_SET(0)
return

~RShift::
  if (GetKeyState("CapsLock", "T")) {
    SetCapsLockState, Off
  }
  IME_SET(1)
return

Contains(arr, str){
  for index, value in arr {
    if (value = str) {
      return true
    }
  }
  return false
}

