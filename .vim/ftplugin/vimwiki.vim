
function! s:ClearPriority()
  let line = getline(".")
  let repl = substitute(line, "] (.)", "]", "g")
  call setline(".", repl)
endfunction
function! s:SetPriority(val)
  call s:ClearPriority()
  let line = getline(".")
  let priority = "] (".a:val.") "
  let repl = substitute(line, "\] ", priority, "g")
  call setline(".", repl)
endfunction

noremap <silent> <leader>1 :call <SID>SetPriority(1)<CR>
noremap <silent> <leader>2 :call <SID>SetPriority(2)<CR>
noremap <silent> <leader>3 :call <SID>SetPriority(3)<CR>
noremap <silent> <leader>4 :call <SID>SetPriority(4)<CR>
noremap <silent> <leader>0 :call <SID>ClearPriority()<CR>

noremap <silent> <leader>tf :exec "normal zMzv"<CR>
vmap s :sort<CR>
