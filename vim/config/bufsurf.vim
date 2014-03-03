
nmap <silent> <C-i> :BufSurfBack<CR>
nmap <silent> <C-o> :BufSurfForward<CR>


function! s:bufremove()
  BufSurfBack
  bd #
endfunction

command! BufRemove call s:bufremove()

nmap <silent> <C-x> :BufRemove<CR>
