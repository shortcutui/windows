IsHidEReplaceCloseApp(){
  apps := ["Thunder.exe", "simplenote.exe", "Telegram.exe"]
  for k,app in apps {
    if WinActive("ahk_exe " . app){
      return true
    }
  }
  return false
}

#If IsHideReplaceCloseApp()
!f4::
Sleep 10
Send, #{Down}
return
#If
