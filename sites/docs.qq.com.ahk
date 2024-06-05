action_docs_qq_com_alt_v(key){
  if(key="e") {
    Send ^a
  }else if(key="p"){
    Send ^+{Up}{Left}^+{Down}
  }
}

action_docs_qq_com_alt_t(key){
  if(key="e") {
    Send ^a
    Send {Left}
  }else if(key="p"){
    Send ^+{Up}{Left}
  }else if(key="n"){
    return true
  }else if(key="o"){
    return true
  }
}

action_docs_qq_com_alt_t_o(key){
  if(key="e"){
    Send ^a
  }
}

action_docs_qq_com_alt_c(key){
  if(key="b"){
    Send ^b
  }else if(key="i"){
    Send ^i
  }
}
