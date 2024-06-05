#If WinActive("ahk_exe regedit.exe")
!n::
winGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, 10, WinHeight/2, 0
Click
return
!i::
!o::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth-30, WinHeight/2, 0
Click
return
!r::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth/2, 60, 0
Click
return
!l::
alt_l_var := true
Sleep 1000
alt_l_var := false
return
#If

#If (alt_l_var and WinActive("ahk_exe regedit.exe"))
.::
  alt_l_var := false
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, WinWidth/2, WinHeight/2, 0
  Click right
  Send n
  return
#If

