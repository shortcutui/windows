funcname  := %0%

show_mouse_pos(){
  WinGetPos, WinX, WinY, WinWidth, WinHeight, A
  MouseGetPos, Mx,  My
  SumX := Mx + WinX
  SumY := My + WinY
  Subx := WinWidth - Mx
  Suby := WinHeight - My
  ToolTip, pos %Mx% : %My% rightbtm %Subx% : %Suby% abspos %SumX% : %SumY% wh %WinWidth% : %WinHeight%
  Sleep 5000
}

addsize_mouse(){
  ;; DllCall("SystemParametersInfo", "Int", 0x2029, "Int", 0, "Ptr", 75, "Int", 0x01)
}

subsize_mouse(){
  ;; DllCall("SystemParametersInfo", "Int", 0x2029, "Int", 0, "Ptr", 0, "Int", 0x01)
}

center_app(){
  SysGet, MonitorInfo, Monitor
  WinGetPos, X, Y, Width, Height, A
  NewW := (MonitorInfoRight - MonitorInfoLeft)/2 + 200
  NewH := (MonitorInfoBottom - MonitorInfoTop)/2 + 100
  NewX := (MonitorInfoRight - MonitorInfoLeft - NewW) / 2 + MonitorInfoLeft
  NewY := (MonitorInfoBottom - MonitorInfoTop - NewH) / 2 + MonitorInfoTop
  WinMove, A, , NewX, NewY, NewW, NewH
}

if(funcname="showpos"){
  show_mouse_pos()
} else if (funcname="addsize") {
  addsize_mouse()
} else if (funcname="subsize") {
  subsize_mouse()
} else if (funcname="center") {
  center_app()
}

