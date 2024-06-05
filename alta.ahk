GlobalAltAHandler(key) {
  if(key = ".") {
    Reload
  } else if(key = "a") {
    MsgBox, you pressed: alt+a %key%
  }
}
