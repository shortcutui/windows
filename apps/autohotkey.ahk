global curIndex = ""

#If WinActive("ahk_exe hh.exe")

~!f4::
curIndex := ""
return

$esc::
return

$!i::
WinGetPos, WinX, WinY, WinWidth, WinHeight, A
MouseMove, 20, WinHeight/2, 0
Click
return

$!r::
if (curIndex = ""){
  Send !c
} else if(curIndex = "c"){
  Send !s
} else if(curIndex = "b"){
  Send !n
}
return

$!n::
if (curIndex = ""){
  curIndex := "c"
  Send !s
} else if(curIndex = "c"){
  curIndex := "b"
  Send !n
} else if(curIndex = "b"){
  curIndex := ""
  Send !c
}
return

$!o::
if (curIndex = ""){
  curIndex := "b"
  Send !n
} else if(curIndex = "b"){
  curIndex := "c"
  Send !s
} else if(curIndex = "c"){
  curIndex := ""
  Send !c
}
return

#If

