fu! DoRunTests()  
  execute "w"
  pclose! " force preview window closed
  
  below new
  resize 15

  execute "%!make test"
  "call delete(tmpfile)

  setlocal previewwindow ro nomodifiable nomodified

  winc p
endfu
command! RunTests call DoRunTests()
