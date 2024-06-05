#If WinActive("ahk_exe ScreenToGif.exe")
Space::
Send, {F7}
return
s::
Send, {F8}
return
q::
Send, {F9}
return
!u::
MouseMove, 35, 47, 0
Click
Sleep 100
MouseMove, 490, 100, 0
Click
Send !e
Sleep 20
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth/2, 200, 0
Click
clipboard := "C:\Users\soluty\Pictures\gif\gif.gif"
return

!a::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth-303, WinHeight-15, 0
MouseClickDrag, left, WinWidth-303, WinHeight-15, WinWidth-303, WinHeight-45
return

#If
