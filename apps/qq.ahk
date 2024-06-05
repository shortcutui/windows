#If WinActive("ahk_exe QQ.exe")
!y::
Click
Send, ^a
Send, ^c
return

!r::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth/2, 70, 0
Click
return

!n::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, 70, 70, 0
Click
return

!i::
!o::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth/2, WinHeight - 70, 0
Click
return

+Up::
Send, ^{Up}
return
+Down::
Send, ^{Down}
return

$!f4::
WinGetTitle, title, A
if (title = "QQ"){
  Sleep 10
  Send, #{Down}
  return
}
Send !{f4}
return

!q::
alt_q_var := true
Sleep 2000
alt_q_var := false
return

#If

#If alt_q_var and WinActive("ahk_exe QQ.exe")
*a::
Run, taskkill /f /t /im QQ.exe
return

#If

