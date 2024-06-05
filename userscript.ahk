#SingleInstance Force
#NoEnv

#Include %A_LineFile%\..\alta.ahk

Gui, Add, Listview, w600 h800 AltSubmit gMyListView, 快捷键|操作解释
LV_Modifycol(1, 60)
LV_Modifycol(2, 536)

keys := {}
keys["."] := "显示全局app快捷键菜单"
keys["a"] := "按a, 或者鼠标点击, 或者alt+a a都可以触发我"

for k,v in keys {
  LV_Add("", k, v)
}

Gui, Show, Center AutoSize, 全局快捷键
Return

GuiClose:
GuiEscape:
ExitApp


MyListView:
if (A_GuiEvent = "Normal")
{
    ;; LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
    GlobalAltAHandler(keys[A_EventInfo])
    ExitApp
}
return

if WinActive("ahk_exe AutoHotkey ahk_class AutoHotkeyGUI"){
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
  .::
  ,::
  /::
    GlobalAltAHandler(A_ThisHotkey)
    ExitApp
  return
}

