#If WinActive("ahk_exe Taskmgr.exe")

!i::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth/2, WinHeight/2, 0
Click
return

#If
