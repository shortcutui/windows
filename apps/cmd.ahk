#If WinActive("ahk_exe cmd.exe") or WinActive("ahk_exe powershell.exe") or WinActive("ahk_exe conhost.exe")

!f4::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth - 35,  15, 0
Click
return

#If
