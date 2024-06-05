DetectHiddenWindows, on
;; TODO: name， class， path
name := %0%
app := name . ".exe"
if (name = "cmd"){
  Run, C:\Windows\System32\cmd.exe
  return
} else if (name = "explorer") {
  Run, C:\Windows\explorer.exe
  return
} else if (name = "ScreenToGif") {
  SetTitleMatchMode, 2
  WinActivate, ScreenToGif ahk_exe %app%
  return
} else if (name = "dialog") {
  if WinExist("ahk_class #32770") {
    WinActivate, ahk_class #32770
  }
  return
}
;; } else if (name = "todo"){
;;   IfWinExist, Microsoft To Do
;;   {
;;     WinRestore, Microsoft To Do
;;     WinActivate, Microsoft To Do
;;   }
;;   return
;; }

IfWinNotExist ahk_exe %app%
{
    if (name = "Code")
    {
      Run, D:\software\Microsoft VS Code\Code.exe
      return
    }
    else if (name = "Thunder")
    {
      Run, D:\software\Thunder\Program\Thunder.exe
      return
    }
    else if (name = "Everything")
    {
      Run, D:\software\Everything\Everything.exe
      return
    }
    else if (name = "Telegram")
    {
      Run, D:\software\Telegram Desktop\Telegram.exe
      return
    }
    else if (name = "wezterm-gui")
    {
      Run, D:\software\WezTerm\wezterm-gui.exe
      return
    }
    else if (name = "WeChat")
    {
      Run, D:\software\Tencent\WeChat\WeChat.exe
      return
    }
    else if (name = "QQ")
    {
      Run, C:\Program Files\Tencent\QQNT\QQ.exe
      return
    }
    else if (name = "chrome")
    {
      Run, C:\Users\soluty\AppData\Local\Chromium\Application\chrome.exe
      return
    }
    else if (name = "brave")
    {
      Run, D:\software\brave\brave.exe
      return
    }
    else if (name = "SumatraPDF")
    {
      Run, d:\software\sumatrapdf\SumatraPDF.exe
      return
    }
    else if (name = "obs64")
    {
      Run, D:\software\obs-studio\bin\64bit\obs64.exe, D:\software\obs-studio\bin\64bit
      return
    }
    else if (name = "todo")
    {
      Run, C:\Users\soluty\AppData\Local\Programs\Simplenote\Simplenote.exe
      return
    }
    else if (name = "anki")
    {
      Run, D:\software\Anki\anki.exe
      return
    }
    else if (name = "notepad")
    {
      Run, d:\software\Notepad--\Notepad--.exe E:/Users/soluty/vm/orgfiles/inbox.org
      ;; Run, C:\Windows\System32\notepad.exe
      return
    }
}
else
{
  IfWinNotActive ahk_exe %app%
  {
    if (name = "Code")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class Chrome_WidgetWin_1
      WinActivate, ahk_id %winID%
    }
    else if (name = "wezterm-gui")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class org.wezfurlong.wezterm
      WinActivate, ahk_id %winID%
      Sleep 200
      WinGet, winID, ID, ahk_exe %app% ahk_class org.wezfurlong.wezterm
      WinActivate, ahk_id %winID%
    }
    else if (name = "WeChat")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class WeChatMainWndForPC
      WinActivate, ahk_id %winID%
    }
    else if (name = "Thunder")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class Chrome_WidgetWin_0
      WinActivate, ahk_id %winID%
    }
    else if (name = "QQ")
    {
      WinGet, winID, IDLast, ahk_exe %app% ahk_class Chrome_WidgetWin_1
      WinActivate, ahk_id %winID%
    }
    else if (name = "chrome")
    {
      WinGet, winID, IDLast, ahk_exe %app% ahk_class Chrome_WidgetWin_1
      WinActivate, ahk_id %winID%
      Sleep 200
      WinGet, winID, ID, ahk_exe %app% ahk_class Chrome_WidgetWin_1
      WinActivate, ahk_id %winID%
    }
    else if (name = "brave")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class Chrome_WidgetWin_1
      WinActivate, ahk_id %winID%
    }
    else if (name = "SumatraPDF")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class SUMATRA_PDF_FRAME
      WinActivate, ahk_id %winID%
    }
    else if (name = "obs64")
    {
      WinGet, winID, IDLast, ahk_exe %app% ahk_class Qt643QWindowIcon
      WinActivate, ahk_id %winID%
    }
    else if (name = "todo")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class Chrome_WidgetWin_1
      WinActivate, ahk_id %winID%
    }
    else if (name = "anki")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class Qt662QWindowIcon
      WinActivate, ahk_id %winID%
    }
    else if (name = "notepad")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class Notepad
      WinActivate, ahk_id %winID%
    }
    else if (name = "SystemPropertiesAdvanced")
    {
      WinGet, winID, ID, ahk_exe %app%
      WinActivate, ahk_id %winID%
    }
    else if (name = "idea64")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class SunAwtFrame
      WinActivate, ahk_id %winID%
    }
    else if (name = "Telegram")
    {
      WinGet, winID, ID, ahk_exe %app% ahk_class Qt5159QWindowIcon
      WinActivate, ahk_id %winID%
    }
    else if (name = "Everything")
    {
      #Include %A_LineFile%\..\tray.ahk
      TrayIcon_Button("Everything.exe", "L", 1)
      ;; WinGet, winID, ID, ahk_exe %app% ahk_class EVERYTHING
      ;; WinActivate, ahk_id %winID%
    }
  }
}
