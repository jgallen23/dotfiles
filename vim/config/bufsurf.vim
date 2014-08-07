
nmap <silent> <C-i> :BufSurfBack<CR>
nmap <silent> <C-o> :BufSurfForward<CR>


function! s:bufremove()
  BufSurfBack
  bd #
endfunction

command! BufRemove call s:bufremove()

nmap <silent> <C-x> :BufRemove<CR>

function s:bufclear()
  let last_buffer = bufnr('$')
  let delete_count = 0
  let n = 1
  while n <= last_buffer
    if buflisted(n)
      if getbufvar(n, '&modified')
        echohl ErrorMsg
        echomsg 'No write since last change for buffer'
        echohl None
      else
        silent exe 'bdel' . n
        if ! buflisted(n)
          let delete_count = delete_count+1
        endif
      endif
    endif
    let n = n+1
  endwhile

  if delete_count == 1
    echomsg delete_count "buffer deleted"
  elseif delete_count > 1
    echomsg delete_count "buffers deleted"
  endif
endfunction

command! BufClear call s:bufclear()
