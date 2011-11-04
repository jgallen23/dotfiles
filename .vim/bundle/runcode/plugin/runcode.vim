fu! DoRunCode()  
  execute "w"
  pclose! " force preview window closed
  
  let ex = "python"
  if &ft == "coffee"
    let ex = "coffee"
  elseif &ft == "javascript"
    let ex = "node"
  elseif &ft == "applescript"
    let ex = "osascript"
  end

  let f = expand("%:p")

  let curfile = bufname("%")
  below new

  execute "%!".ex." ".curfile
  "call delete(tmpfile)

  setlocal previewwindow ro nomodifiable nomodified

  winc p
endfu
command! RunCode call DoRunCode()
