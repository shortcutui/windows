#Include %A_LineFile%\..\..\common.ahk

#If WinActive("ahk_exe SumatraPDF.exe")
$!y::
alt_y_var := true
Sleep 1000
alt_y_var := false
return

$!s::
alt_s_var := true
return

^g::
ctrl_g_var := true
Sleep 1000
ctrl_g_var := false
return

!q::
alt_q_var := true
IME_SET(0)
Sleep 1000
alt_q_var := false
return
#If

#If (alt_s_var and WinActive("ahk_exe SumatraPDF.exe"))
  Esc::
  alt_s_var := false
  return
  CapsLock::
  alt_s_var := false
  return
  s::
  alt_s_var := false
  return
  u::
  ;; alt_s_var := false
  ;; Send ^{+}
  ;; 鼠标滚轮向上, 不知道为啥键盘用不了
  Send {Ctrl Down}
  DllCall("mouse_event", "UInt", 0x800, "UInt", 0, "UInt", 0, "UInt", 120, "Ptr", 0)
  Send {Ctrl Up}
  return
  d::
  ;; alt_s_var := false
  Send ^{-}
  return
#If

^F18::
  content := clipboard
  content := StrReplace(content, "\", "/")
  Send ^c
  changeContent := content . ":" . clipboard
  clipboard := changeContent
return

#If (alt_y_var and WinActive("ahk_exe SumatraPDF.exe"))
  p::
  alt_y_var := false
  Send ^!+p
  return
  i::
  alt_y_var := false
  Send ^!+p
  Send !g
  Send, {Ctrl down}{F18}{Ctrl up}
  Send {Esc}
  return
#If

#If (ctrl_g_var and WinActive("ahk_exe SumatraPDF.exe"))
  m::
  ctrl_g_var := false
  Send ^!+p
  Send !g
  Send, {Ctrl down}{F18}{Ctrl up}
  Send, {Esc}
  Sleep 10
  RunWait, komorebic.exe focus-named-workspace "editor", , Hide
  Sleep 200
  Send ^!tv
  Sleep 100
  Send gmc
  return
#If
