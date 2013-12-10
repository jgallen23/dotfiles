command! TodoToday call Grep('^\s*--\s.*#today')
command! TodoWeek call Grep('^\s*--\s.*#week')
command! TodoAll call Grep('^\s*--\s')
command! Todos call s:open_todos()

function! s:open_todos()
  execute 'cd '.resolve(expand('~/Dropbox/Notes'))
  e tasks/computer.md
  NERDTree
endfunction

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
  setlocal list listchars=tab:\ \ ,trail:·
endfunction

augroup vimrc-markdown
	autocmd!
	autocmd FileType mkd call s:markdown_setup()
augroup END
autocmd Syntax mkd normal zR
