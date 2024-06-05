#If WinActive("ahk_exe Fluent Reader.exe")

!l::
alt_l_var := true
Sleep 1000
alt_l_var := false
return

!u::
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, 25, 15, 0
  Click
return
!n::
!o::
  Send {Tab}
return

#If

#If (alt_l_var and WinActive("ahk_exe Fluent Reader.exe"))

  m::
  alt_l_var := false
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, WinWidth-200, 15, 0
  Click
  return

  v::
  alt_l_var := false
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, WinWidth-250, 15, 0
  Click
  return

#If
