#Include %A_LineFile%\..\..\common.ahk

IsVimApps(){
  vimApps := ["goland64.exe","Code.exe","idea64.exe","cmd.exe","wezterm-gui.exe","obsidian.exe", "neovide.exe"]
  for k,app in vimApps {
    if WinActive("ahk_exe " . app){
      return true
    }
  }
  return false
}

NoEscApps(){
  apps :=  ["Wechat.exe","WXWork.exe","QQ.exe", "Clash Verge.exe"]
  for k,app in apps {
    if WinActive("ahk_exe " . app) {
      return true
    }
  }
  return false
}

#If NoEscApps()
Esc::
return
#If

#If IsVimApps()
$Esc::
  if (WinExist("ahk_class SoPY_Comp")){
    Send {Space}
  }
  IME_SET(0)
  Send {Esc}
return
#If

