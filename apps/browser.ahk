IsInBrowser(){
  browsers := ["chrome.exe", "msedge.exe", "brave.exe"]
  for k,app in browsers {
    if WinActive("ahk_exe " . app){
      return true
    }
  }
  return false
}

global browser_alt_char = ""
#If IsInBrowser()
^!s::
ctrl_alt_s_var := true
return
^!g::
ctrl_alt_g_var := true
Sleep %SUI_LEADER_DELAY%
ctrl_alt_g_var := false
return
^!w::
ctrl_alt_w_var := true
Sleep %SUI_LEADER_DELAY%
ctrl_alt_w_var := false
return
^!u::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, WinWidth-64, 173, 0
Click
return

$!r::
Send ^!yn
sitename := clipboard
;; this is homepage of itab
if (sitename = "mhloojimgilafopcmlcikiidgbbnelip") {
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, WinWidth/2, WinHeight/2, 0
  Send {WheelUp}
  return
}
Send !r
return
$!i::
Send ^!yn
sitename := clipboard
;; this is homepage of itab
if (sitename = "mhloojimgilafopcmlcikiidgbbnelip") {
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, WinWidth/2, WinHeight/2, 0
  Send {WheelDown}
  return
}
Send !i
return

$!t::
$!v::
;; $!c::
browser_alt_var := true
browser_alt_char := SubStr(A_ThisHotKey, 3, 5)
Send ^!yn
Sleep %SUI_LEADER_DELAY%
browser_alt_var := false
return
#If

transFerSite(site, key){
  if(key="."){
    return "action_" . StrReplace(site, ".", "_") . "_alt_dot"
  }else if(key=","){
    return "action_" . StrReplace(site, ".", "_") . "_alt_comma"
  }else if(key="/"){
    return "action_" . StrReplace(site, ".", "_") . "_alt_slash"
  }
  return "action_" . StrReplace(site, ".", "_") . "_alt_" . key
}

#If (browser_alt_var and IsInBrowser())
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
  .::
  /::
  browser_alt_var := false
  sitename := clipboard
  actionFuncName := transFerSite(sitename, browser_alt_char)
  ;; MsgBox, call function %actionFuncName%
  if (IsFunc(actionFuncName)) {
    funcRet := %actionFuncName%(A_ThisHotkey)
    if (funcRet){
      browser_alt_alt_var := true
      browser_alt_alt_char := A_ThisHotkey
      browser_alt_alt_func := actionFuncName . "_" . A_ThisHotkey
      Sleep %SUI_LEADER_DELAY%
      browser_alt_alt_var := false
    }
  }else{
    ;; MsgBox, alt_%browser_alt_char%%A_ThisHotkey%
    Send !%browser_alt_char%%A_ThisHotkey%
  }
  return
#If

#If (browser_alt_alt_var and IsInBrowser())
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
  .::
  /::
  browser_alt_alt_var := false
  ;; MsgBox, call function %browser_alt_alt_func%
  if (IsFunc(browser_alt_alt_func)) {
    %browser_alt_alt_func%(A_ThisHotkey)
  }else{
    ;; MsgBox, alt_!%browser_alt_char%%browser_alt_alt_char%%A_ThisHotkey%
    Send !%browser_alt_char%%browser_alt_alt_char%%A_ThisHotkey%
  }
  return
#If

#If (ctrl_alt_w_var and IsInBrowser())
  d::
  ctrl_alt_w_var := false
  Send ^+j
  return
  Left::
  ctrl_alt_w_var := false
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, 20, WinHeight/2, 0
  Click
  return
  Right::
  ctrl_alt_w_var := false
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseMove, WinWidth-40, WinHeight-30, 0
  Click
  return
  r::
  Send ^r
  return
  y::
  Send ^y
  return
#If

#If (ctrl_alt_g_var and IsInBrowser())
  .::
  ctrl_alt_g_var := false
  MouseMove, 27, 54, 0
  Click down
  Sleep %SUI_LEADER_DELAY%
  Click up
  return
#If

#If (ctrl_alt_s_var and IsInBrowser())
  Capslock::
  ctrl_alt_s_var := false
  Esc::
  ctrl_alt_s_var := false
  Space::
  ctrl_alt_s_var := false
  return
  u::
  Send ^{+}
  return
  d::
  Send ^-
  return
#If

;; Used with surfingkeys to hover mouse
OnClipboardChange:
If (A_EventInfo = 1) {
  ClipboardContent := Clipboard
  prefix := "_-_soluty-_-fy___"
  if (SubStr(ClipboardContent, 1, StrLen(prefix)) = prefix) {
    ClipboardContent := SubStr(ClipboardContent, StrLen(prefix) + 1)
    pattern := "(\w+):(\d+):(\d+)"
    if RegExMatch(ClipboardContent, pattern, matches) {
      colonPos := InStr(matches, ":")
      if (colonPos > 0) {
        appname := SubStr(matches, 1, colonPos-1)
        xypos := SubStr(matches, colonPos + 1)
        cpos2 := InStr(xypos, ":")
        num1 := SubStr(xypos, 1, cpos2 - 1)
        num2 := SubStr(xypos, cpos2 + 1)
        realnum2 := num2 + 84
        if (appname = "chrome") {
          MouseMove, num1, realnum2, 0
        } else if (appname = "chrome_rclick") {
          MouseMove, num1, realnum2, 0
          Click right
        }
      }
    }
  }
}
return

