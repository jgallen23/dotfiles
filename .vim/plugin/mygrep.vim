function! MyGrep(...)

  let options = '-rsinI'
  let pattern = join(a:000, " ") 
  let dir = '*'

  let exclude = 'grep -v ".git\|node_modules\|_compressed"'
  let cmd = 'grep '.options.' "'.pattern.'" '.dir. '| '.exclude
  let cmd_output = system(cmd)
  if cmd_output == ""
    echomsg "Pattern " . pattern . " not found"
    return
  endif

  let tmpfile = tempname()
  exe "redir! > " . tmpfile
  silent echon '[grep search for "'.pattern.'" with options "'.options.'"]'."\n"
  silent echon cmd_output
  redir END

  let old_efm = &efm
  set efm=%f:%\\s%#%l:%m

  execute "silent! cgetfile " . tmpfile
  let &efm = old_efm
  botright copen

  call delete(tmpfile)
endfunction
command! -nargs=* -complete=file MyGrep call MyGrep(<f-args>)

