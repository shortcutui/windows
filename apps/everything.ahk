#If WinActive("ahk_exe Everything.exe")

!y::
Send ^+c
Send {Esc}
return

!u::
Send ^+c
Sleep 50
Run E:\Users\soluty\vm\app\win10\bin\QuickLook-3.7.3\QuickLook.exe %clipboard%
return

#If
