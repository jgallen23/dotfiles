function! QFOpenAndClose()
  .cc
  cclose
endfunction

function! s:qf_setup()
	noremap <buffer> <silent> o :call QFOpenAndClose()<CR>
endfunction
augroup vimrc-qf
	autocmd!
	autocmd FileType qf call s:qf_setup()
augroup END
