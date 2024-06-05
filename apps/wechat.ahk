#If WinActive("ahk_exe WeChat.exe")
!y::
Click 2
Send, ^c
return

!r::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth-20, 70, 0
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

!u::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth/2, 288, 0
Click
return

$!f4::
WinGetTitle, title, A
WinGetClass, class, A
if (title = "微信"){
  if (class = "TrayNotifyWnd") {
    Send !{f4}
  } else {
    Sleep 10
    Send, #{Down}
  }
  return
}
Sleep 10
Send !{f4}
return

!q::
alt_q_var := true
Sleep 2000
alt_q_var := false
return

!w::
alt_w_var := true
Sleep 2000
alt_w_var := false
return

#If

#If alt_q_var and WinActive("ahk_exe WeChat.exe")
*a::
Run, taskkill /f /t /im WeChat.exe
return

#If

#If alt_w_var and WinActive("ahk_exe WeChat.exe")
esc::
alt_w_var := false
return

w::
alt_w_var := false
Send ^f
Send 文件传输助手
Sleep 1000
Send {Enter}
return

#If
