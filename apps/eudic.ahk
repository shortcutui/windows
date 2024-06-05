#If WinActive("ahk_exe eudic.exe")

!r::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth/2, 55, 0
Click
return

!i::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth/2, WinHeight-30, 0
Click
return

#If

