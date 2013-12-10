command! TodoToday call Grep('^\s*--\s.*#today')
command! TodoWeek call Grep('^\s*--\s.*##week')
command! TodoAll call Grep('^\s*--\s')

function! s:markdown_setup()
	setlocal wrap
	setlocal noexpandtab
  noremap <buffer> <unique> <silent> k gk
  noremap <buffer> <unique> <silent> j gj
  noremap <silent> <up> :call SwapUp()<CR>
  noremap <silent> <down> :call SwapDown()<CR>
  noremap <silent> <leader>tt :TodoToday<CR>
  noremap <silent> <leader>tw :TodoWeek<CR>
  noremap <silent> <leader>ta :TodoAll<CR>
endfunction

augroup vimrc-markdown
	autocmd!
	autocmd FileType mkd call s:markdown_setup()
augroup END
autocmd Syntax mkd normal zR
