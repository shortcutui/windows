#If WinActive("ahk_exe wps.exe")

!n::
Send, ^{PgUp}
return
!o::
Send, ^{PgDn}
return

!Left::
Send, ^+{Tab}
return
!Right::
Send, ^{Tab}
return

!q::
alt_q_var := true
Sleep 1000
alt_q_var := false
return

!l::
alt_l_var := true
Sleep 1000
alt_l_var := false
return

!w::
alt_w_var := true
Sleep 1000
alt_w_var := false
return

#If

#If (alt_q_var and WinActive("ahk_exe wps.exe"))

esc::
  alt_q_var := false
return

q::
  alt_q_var := false
  Send ^w
return

#If

#If (alt_l_var and WinActive("ahk_exe wps.exe"))
esc::
  alt_l_var := false
return

l::
  alt_l_var := false
  Send ^n
return

p::
  alt_l_var := false
  Send ^m
return

.::
  alt_l_var := false
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, WinWidth/2, WinHeight/2 , 0
  Click
  ImageSearch, FoundX, FoundY, 0, 0, WinWidth, 45, %A_LineFile%\..\wps.PNG
  if (ErrorLevel = 2 or ErrorLevel = 1){
    return
  }
  MouseMove, FoundX, FoundY , 0
  Click
  MouseMove, FoundX+13, FoundY+30 , 0
return

#If

#If (alt_w_var and WinActive("ahk_exe wps.exe"))

esc::
  alt_w_var := false
return
;; window menu
m::
  alt_w_var := false
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, 40, 50 , 0
  Click
return

#If

