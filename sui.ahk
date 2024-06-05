#Persistent
#SingleInstance Force
global SUI_CURRENT_IM := 0
global SUI_WM = "komorebi"
global SUI_LEADER_DELAY := 2000

OnExit, ShowCursor
return

ShowCursor:
SystemCursor("On")
ExitApp

#Include %A_LineFile%\..\common.ahk

;; add ctrl start key
transFer(key){
  if (key = ".") {
    return SUI_WM . "ActionCtrl_dot"
  } else if (key = ",") {
    return SUI_WM . "ActionCtrl_comma"
  }else if(key="/"){
    return SUI_WM . "ActionCtrl_slash"
  }

  return SUI_WM . "ActionCtrl_" . key
}

transFerCommon(key){
  if (key = ".") {
    return "commonActionCtrl_dot"
  } else if (key = ",") {
    return "commonActionCtrl_comma"
  } else if (key = "/") {
    return "commonActionCtrl_slash"
  }
  return "commonActionCtrl_" . key
}

$*^.::
$*^y::
$*^m::
pressedKey := SubStr(A_ThisHotKey, 4, 5)
if GetKeyState("Alt", "p") {
  Send ^!%pressedKey%
  return
}
actionFuncName := transFerCommon(pressedKey)
if (IsFunc(actionFuncName)) {
  %actionFuncName%(pressedKey)
} else {
  Send ^%pressedKey%
}
return

$^s::
pressedKey := SubStr(A_ThisHotKey, 3, 5)
actionFuncName := transFer(pressedKey)
if (IsFunc(actionFuncName)) {
  %actionFuncName%(pressedKey)
} else {
  Send ^%pressedKey%
}
return

;; end ctrl start key

common_ctrl_shift_y_timer:
  common_ctrl_shift_y_var := false
  SetTimer, common_ctrl_shift_y_timer, off
return
common_ctrl_y_timer:
  common_ctrl_y_var := false
  SetTimer, common_ctrl_y_timer, off
return
global common_ctrl_y_var := false
global common_ctrl_shift_y_var := false
commonActionCtrl_y(){
  if (GetKeyState("Shift","P")){
    common_ctrl_shift_y_var := true
    SetTimer, common_ctrl_shift_y_timer, -%SUI_LEADER_DELAY%
    return
  }
  common_ctrl_y_var := true
  SetTimer, common_ctrl_y_timer, -%SUI_LEADER_DELAY%
}
#If (common_ctrl_shift_y_var)
  esc::
  common_ctrl_shift_y_var := false
  return
  e:: ;
  common_ctrl_shift_y_var := false
  fileattr := FileExist(clipboard)
  if (not fileattr){
      return
  }
  if (fileattr="D"){
    explorerCommand := SYSTEMROOT . "\explorer.exe " . clipboard
    Run, %explorerCommand%
  }else{
    explorerCommand := SYSTEMROOT . "\explorer.exe /select," . clipboard
    Run, %explorerCommand%
  }
  ;; MsgBox, %fileattr%
  return
  t:: ;
  common_ctrl_shift_y_var := false
  Send ^{F12}
  Sleep 100
  Send ^v
  return
  f:: ;
  common_ctrl_shift_y_var := false
  text := clipboard
  pattern := "^[A-Za-z]"
  if RegExMatch(ClipboardContent, pattern, matches) {
    url := "https://www.deepl.com/translator#en/zh/" . text
    Run,  %url%
  } else {
    url := "https://www.deepl.com/translator#zh/en/" . text
    Run,  %url%
  }
  return
  o:: ;
  common_ctrl_shift_y_var := false
  Run, Umi-OCR.exe --clipboard
  return
  i:: ;
  common_ctrl_shift_y_var := false
  WinGet, processNamew, ProcessName, A
  if (processNamew = "WeChat.exe"){
    WinGetPos, WinX, WinY, WinWidth, WinHeight, A
    ImageSearch, FoundX, FoundY, 0, 0, WinWidth, WinHeight, %A_LineFile%\..\apps\wechat_file.PNG
    if (ErrorLevel = 2 or ErrorLevel = 1){
      return
    }
    MouseMove, FoundX, FoundY, 0
    Click
    Sleep 100
    Send ^v
    Send {enter}
  } else if(processNamew = "QQ.exe") {
    WinGetPos, WinX, WinY, WinWidth, WinHeight, A
    ImageSearch, FoundX, FoundY, 0, 0, WinWidth, WinHeight, %A_LineFile%\..\apps\qq_file.PNG
    if (ErrorLevel = 2 or ErrorLevel = 1){
      return
    }
    MouseMove, FoundX+10, FoundY+10, 0
    Click
    Sleep 100
    Send ^v
    Send {enter}
  }
  return
#If

moveToAppCenter(){
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, WinWidth/2, WinHeight/2, 0
}

#If (common_ctrl_y_var)
  esc::
  common_ctrl_y_var := false
  return
  y::
  common_ctrl_y_var := false
  moveToAppCenter()
  Run, "%SystemRoot%\system32\SnippingTool.exe"
  Sleep 500
  Send !mw
  Sleep 500
  Click
  Sleep 200
  Send !{F4}
  return
  a::
  common_ctrl_y_var := false
  Run, "%SystemRoot%\system32\SnippingTool.exe"
  Sleep 500
  Send !ms
  return
  r::
  common_ctrl_y_var := false
  Run, "%SystemRoot%\system32\SnippingTool.exe"
  Sleep 500
  Send !mr
  return
  .::
  common_ctrl_y_var := false
  Run, "%SystemRoot%\system32\SnippingTool.exe"
  Sleep 500
  Send !mf
  return
  w::
  common_ctrl_y_var := false
  moveToAppCenter()
  Run, "%SystemRoot%\system32\SnippingTool.exe"
  Sleep 500
  Send !mw
  Sleep 500
  Click
  return
  p::
  common_ctrl_y_var := false
  WinGet, processPath, ProcessPath, A
  Clipboard := processPath
  return
  n::
  common_ctrl_y_var := false
  WinGet, processNamew, ProcessName, A
  Clipboard := processNamew
  return
  i::
  common_ctrl_y_var := false
  WinGetActiveTitle, activeTitle
  WinGet, activeHwnd, ID, %activeTitle%
  GetWindowInfo(activeHwnd)
  return
  g:: ; need ScreenToGif run in daemon and set start shortcut
  common_ctrl_y_var := false
  ;; Send, ^{F12}
  Send, ^{F3}
  return
  v::
  common_ctrl_y_var := false
  ; need obs to record video
  if WinExist("ahk_exe obs64.exe")
  {
    WinGet, winID, ID, ahk_exe "obs64.exe" ahk_class Qt643QWindowIcon
    WinActivate, ahk_id %winID%
    Sleep 200
    Send, ^+o
  } else {
    ToolTip no obs window..
  }
  return
#If

obs_is_pause := false
#IfWinActive, ahk_exe obs64.exe
s::
ToolTip
Send, ^+q
return
Space::
if(obs_is_pause){
  obs_is_pause := false
  Send, ^+l
  ToolTip
} else {
  obs_is_pause := true
  Send, ^+p
  ToolTip obs_is_pause..
}
return
#IfWinActive

$^f6::
common_ctrl_w_var := true
return

global common_ctrl_w_var := false
commonActionCtrl_w(){
  common_ctrl_w_var := true
}
#If (common_ctrl_w_var)
  .::
  Send  {Alt Down}{Tab Down}
  return
  !Esc::
  common_ctrl_w_var := false
  Send {Tab Up}{Esc}{Alt Up}
  return
  !CapsLock::
  common_ctrl_w_var := false
  Send {Tab Up}{Alt Up}
  return
  !Enter::
  common_ctrl_w_var := false
  Send {Tab Up}{Alt Up}
  return
  !Space::
  common_ctrl_w_var := false
  Send {Tab Up}{Alt Up}
  return
  !q::
  common_ctrl_w_var := false
  Send {Tab Up}{Alt}{F4}{Alt Up}
  return
#If

EnterCopyFilterMode(cmd){
  if WinExist("ahk_exe wezterm-gui.exe ahk_class org.wezfurlong.wezterm"){
    WinGet, winID, ID, A
    quicklyDirModeWinID := winID
    WinGet, winID, ID, ahk_exe wezterm-gui.exe ahk_class org.wezfurlong.wezterm
    WinActivate, ahk_id %winID%
    Sleep 100
    Send ^!ts
    Send ^ed
    clipboard := cmd
    Send ^v{enter}
    ;; Send %cmd%{enter}
    Sleep 100
    quicklyDirMode := true
  }
}

common_ctrl_dot_timer:
  common_ctrl_dot_var := false
  SetTimer, common_ctrl_dot_timer, off
return

global quicklyDirModeWinID := ""
global quicklyDirMode := false
global common_ctrl_dot_var := false
commonActionCtrl_dot(){
  common_ctrl_dot_var := true
  SetTimer, common_ctrl_dot_timer, -%SUI_LEADER_DELAY%
}
#If (common_ctrl_dot_var)
  q::
  common_ctrl_dot_var := false
  SystemCursor("Off")
  MouseMove, 0, 0, 0
  return
  o::
  common_ctrl_dot_var := false
  SystemCursor("On")
  return
  x::
  common_ctrl_dot_var := false
  Run, taskkill /f /t /im win-vind.exe
  return
  d::
  common_ctrl_dot_var := false
  ;; goto some dir and return to current window
  EnterCopyFilterMode("zc")
  return
  common_ctrl_dot_var := false
  p::
  ;; EnterCopyFilterMode("cat E:\Users\soluty\vm\.bookmark.md | fzf -m --preview ""echo {}"" | win32yank -i")
  EnterCopyFilterMode("cat E:\Users\soluty\vm\.bookmark.md | fzf -m | win32yank -i")
  return
  Esc::
  common_ctrl_dot_var := false
  return
#If

#If (quicklyDirMode)
esc::
  quicklyDirMode := false
return
~Enter::
  quicklyDirMode := false
  WinActivate, ahk_id %quicklyDirModeWinID%
return
#If

komorebi_ctrl_s_timer:
  komorebi_ctrl_s_var := false
  SetTimer, komorebi_ctrl_s_timer, off
return
global komorebi_ctrl_s_var := false
komorebiActionCtrl_s(){
  komorebi_ctrl_s_var := true
  SetTimer, komorebi_ctrl_s_timer, -%SUI_LEADER_DELAY%
}
#If (komorebi_ctrl_s_var)
z::
komorebi_ctrl_s_var := false
WinGetActiveTitle, activeTitle
WinGet, procName, ProcessName, %activeTitle%
WinGet Style, Style, % "ahk_exe " procName

if (Style & 0xC40000) {
  WinSet, Style, -0xC40000, % "ahk_exe " procName
  WinHide, ahk_class Shell_TrayWnd
} else {
  WinSet, Style, +0xC40000, % "ahk_exe " procName
  WinShow, ahk_class Shell_TrayWnd
}

winget,state,minmax,A
if(state == 1) {
  WinRestore, A
} else {
  WinMaximize, A
}
return
u::
SoundGet, currentVolume
newVolume := currentVolume + 5
SoundSet, %newVolume%
return
d::
SoundGet, currentVolume
newVolume := currentVolume - 5
SoundSet, %newVolume%
return
s::
SoundSet, 50
return

#Include %A_LineFile%\..\alta.ahk
#Include %A_LineFile%\..\sites\docs.qq.com.ahk
#Include %A_LineFile%\..\apps\esc.ahk
#Include %A_LineFile%\..\apps\browser.ahk
#Include %A_LineFile%\..\apps\hidereplaceclose.ahk
#Include %A_LineFile%\..\apps\wechat.ahk
#Include %A_LineFile%\..\apps\qq.ahk
#Include %A_LineFile%\..\apps\sumatrapdf.ahk
#Include %A_LineFile%\..\apps\explorer.ahk
#Include %A_LineFile%\..\apps\regedit.ahk
#Include %A_LineFile%\..\apps\eudic.ahk
#Include %A_LineFile%\..\apps\ScreenToGif.ahk
#Include %A_LineFile%\..\apps\anki.ahk
#Include %A_LineFile%\..\apps\Taskmgr.ahk
#Include %A_LineFile%\..\apps\autohotkey.ahk
#Include %A_LineFile%\..\apps\cmd.ahk
#Include %A_LineFile%\..\apps\wps.ahk
#Include %A_LineFile%\..\apps\everything.ahk
#Include %A_LineFile%\..\apps\mpv.ahk
#Include %A_LineFile%\..\apps\rss.ahk

!/::
Send ^f
return

^p::
alt_t_var := true
Sleep %SUI_LEADER_DELAY%
alt_t_var := false
return

#If (alt_t_var)
  p::
  alt_t_var = false
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, WinWidth/2, WinHeight/2, 0
  Click
  SystemCursor("Off")
  return
#If

!x::
alt_x_var := true
Sleep %SUI_LEADER_DELAY%
alt_x_var := false
return
#If (alt_x_var)
 *a::
 *b::
 *c::
 *d::
 *e::
 *f::
 *g::
 *h::
 *i::
 *j::
 *k::
 *l::
 *m::
 *n::
 *o::
 *p::
 *q::
 *r::
 *s::
 *t::
 *u::
 *v::
 *w::
 *x::
 *y::
 *z::
 *,::
 *.::
 */::
  alt_x_var = false
  subkey := SubStr(A_ThisHotKey, 2, 1)
  if (GetKeyState("Shift","P")){
    Send, !+%subkey%
    return
  }
  Send, !%subkey%
  return
#If

!z::
alt_z_var := true
Sleep %SUI_LEADER_DELAY%
alt_z_var := false
return
#If (alt_z_var)
 *a::
 *b::
 *c::
 *d::
 *e::
 *f::
 *g::
 *h::
 *i::
 *j::
 *k::
 *l::
 *m::
 *n::
 *o::
 *p::
 *q::
 *r::
 *s::
 *t::
 *u::
 *v::
 *w::
 *x::
 *y::
 *z::
 *,::
 *.::
 */::
  alt_z_var = false
  subkey := SubStr(A_ThisHotKey, 2, 1)
  if (GetKeyState("Shift","P")){
    Send, ^+%subkey%
    return
  }
  Send, ^%subkey%
  return
#If

!c::
Send {WheelLeft 5}
return
!v::
Send {WheelRight 5}
return
!a::
alt_a_var := true
Sleep %SUI_LEADER_DELAY%
alt_a_var := false
return

#If (alt_a_var)
a::
b::
c::
d::
e::
f::
g::
h::
i::
j::
k::
l::
m::
n::
o::
p::
q::
r::
s::
t::
u::
v::
w::
x::
y::
z::
,::
/::
GlobalAltAHandler(A_ThisHotkey)
return
.::
Run, %A_LineFile%\..\userscript.ahk
return
#If

;; Hide mouse
SystemCursor(OnOff=1)   ; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others
{
    static AndMask, XorMask, $, h_cursor
        ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 ; system cursors
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; blank cursors
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; handles of default cursors
    if (OnOff = "Init" or OnOff = "I" or $ = "")       ; init when requested or at first call
    {
        $ = h                                          ; active default cursors
        VarSetCapacity( h_cursor,4444, 1 )
        VarSetCapacity( AndMask, 32*4, 0xFF )
        VarSetCapacity( XorMask, 32*4, 0 )
        system_cursors = 32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650
        StringSplit c, system_cursors, `,
        Loop %c0%
        {
            h_cursor   := DllCall( "LoadCursor", "uint",0, "uint",c%A_Index% )
            h%A_Index% := DllCall( "CopyImage",  "uint",h_cursor, "uint",2, "int",0, "int",0, "uint",0 )
            b%A_Index% := DllCall("CreateCursor","uint",0, "int",0, "int",0
                , "int",32, "int",32, "uint",&AndMask, "uint",&XorMask )
        }
    }
    if (OnOff = 0 or OnOff = "Off" or $ = "h" and (OnOff < 0 or OnOff = "Toggle" or OnOff = "T"))
        $ = b  ; use blank cursors
    else
        $ = h  ; use the saved cursors

    Loop %c0%
    {
        h_cursor := DllCall( "CopyImage", "uint",%$%%A_Index%, "uint",2, "int",0, "int",0, "uint",0 )
        DllCall( "SetSystemCursor", "uint",h_cursor, "uint",c%A_Index% )
    }
}

global common_ctrl_m_var := false
commonActionCtrl_m(){
  common_ctrl_m_var := true
}
#If (common_ctrl_m_var)
  esc::
  ~*a::
  ~*b::
  ~*c::
  ~*d::
  ~*e::
  ~*f::
  ~*g::
  ~*h::
  ~*j::
  ~*k::
  ~*l::
  ~*m::
  ~*p::
  ~*q::
  ~*s::
  ~*t::
  ~*u::
  ~*v::
  ~*w::
  ~*x::
  ~*y::
  ~*z::
  ~*,::
  ~*.::
  ~*/::
  ~*1::
  ~*2::
  ~*3::
  ~*4::
  ~*5::
  ~*6::
  ~*7::
  ~*8::
  ~*9::
  ~*0::
  ~*-::
  ~*=::
  common_ctrl_m_var := false
  return
  r::
  WinGetPos, X, Y, Width, Height, A
  NewY := Y - 100
  WinMove, A,, X, NewY, Width, Height
  return
  i::
  WinGetPos, X, Y, Width, Height, A
  NewY := Y + 100
  WinMove, A,, X, NewY, Width, Height
  return
  n::
  WinGetPos, X, Y, Width, Height, A
  NewX := X - 100
  WinMove, A,, NewX, Y, Width, Height
  return
  o::
  WinGetPos, X, Y, Width, Height, A
  NewX := X + 100
  WinMove, A,, NewX, Y, Width, Height
  return
#If
