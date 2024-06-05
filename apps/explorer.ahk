IsCtrlTabSwitch(){
  apps := ["SystemPropertiesAdvanced.exe", "Taskmgr.exe", "rundll32.exe"]
  for k,app in apps {
    if WinActive("ahk_exe " . app){
      return true
    }
  }
  return false
}

#If IsCtrlTabSwitch()
  !n::
  Send ^+{Tab}
  return
  !o::
  Send ^{Tab}
  return
#If

#If WinActive("ahk_exe Explorer.EXE") or WinActive("ahk_class #32770")
!y::
alt_y_var := true
Sleep 1000
alt_y_var := false
return
!n:: ; goto sidebar
if(IsCtrlTabSwitch()){
  Send ^+{Tab}
  return
}
Send !d
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
if(WinActive("ahk_class #32770")){
  Send {Tab}
}
return
!o::
if(IsCtrlTabSwitch()){
  Send ^+{Tab}
  return
}
Send !d
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Send {Tab}
if(WinActive("ahk_class #32770")){
  Send {Tab}
}
return
!a::
alt_a_var := true
Sleep 1000
alt_a_var := false
return
!s::
Send ^f
Send ^f
Send ^+f
return
!g::
alt_g_var := true
Sleep 1000
alt_g_var := false
return
!l::
alt_l_var := true
Sleep 1000
alt_l_var := false
return
!r::
Send !{Up}
return
!i::
Send {Enter}
return
#If

#If (alt_l_var and (WinActive("ahk_exe Explorer.EXE") or WinActive("ahk_class #32770")))
  .::  ; new file
  alt_l_var := false
  if(WinActive("ahk_class #32770")){
    return
  }
  Send !h
  Sleep 50
  Send w
  return
  t::  ; 新建文本文件,修改注册表
  ;; 计算机\HKEY_CLASSES_ROOT\Local Settings\MuiCache\b2\AAF68885
  ;; @C:\Windows\system32\notepad.exe,-469     文本文档(&T)
  alt_l_var := false
  if(WinActive("ahk_class #32770")){
    return
  }
  Send !h
  Sleep 50
  Send w
  Sleep 50
  Send t
  return
  d::  ; new dir
  alt_l_var := false
  Send ^+n
  return
#If

#If (alt_g_var and (WinActive("ahk_exe Explorer.EXE") or WinActive("ahk_class #32770")))
  n::
  alt_g_var := false
  Send !{Left}
  return
  o::
  alt_g_var := false
  Send !{Right}
  return
  .::
  alt_g_var := false
  Send !{d}!{Down}
  return
  d::
  alt_g_var := false
  Send !{Enter}
  Send !f
  Send !{f4}
  return
  r::
  alt_g_var := false
  Send !h
  Sleep 100
  Send cp
  Sleep 200
  filePath := clipboard
  folderPath := GetParentFolder(filePath)
  explorerCommand := SYSTEMROOT . "\explorer.exe /e," . folderPath
  Run, %explorerCommand%
  return
#If

GetParentFolder(filePath) {
  SplitPath, filePath, fileName, folderPath
  return folderPath . Chr(34)
}

#If (alt_y_var and (WinActive("ahk_exe Explorer.EXE") or WinActive("ahk_class #32770")))
  n::
    alt_y_var := false
    Send {F2}
    Sleep 100
    Send ^c{Esc}
  return
  p::
    alt_y_var := false
    Send !h
    Sleep 100
    Send cp
  return
  d::
    alt_y_var := false
    Send !h
    Sleep 100
    Send cp
    Sleep 200
    filePath := clipboard
  return
#If

#If (alt_a_var and (WinActive("ahk_exe Explorer.EXE") or WinActive("ahk_class #32770")))
  d::
    alt_a_var := false
    Send {Delete}
  return
  r::
    alt_a_var := false
    Send {F2}
  return
#If

