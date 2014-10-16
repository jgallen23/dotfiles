
nmap <silent> <C-i> :BufSurfBack<CR>
nmap <silent> <C-o> :BufSurfForward<CR>


function! s:bufremove()
  try
    silent exe 'BufSurfBack'
    bd #
  catch
    bd
  endtry
endfunction

command! BufRemove call s:bufremove()

nmap <silent> <C-c> :BufRemove<CR>

