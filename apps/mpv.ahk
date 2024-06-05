#If WinActive("ahk_exe mpv.exe")

!l::
alt_l_var := true
Sleep 1000
alt_l_var := false
return

#If

#If (alt_l_var and WinActive("ahk_exe mpv.EXE"))

esc::
alt_l_var := false
return

l::
.::
alt_l_var := false
Send ^i
return

#If

