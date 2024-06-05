#If WinActive("ahk_exe anki.exe")

!o::
!r::
Send ^f
Send {Tab}
return

!i::
Send ^f
Send {Tab 5}
return

!n::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, 20, WinHeight-33, 0
Click
return

#If
