command! TodoToday call Grep('^\s*--\s.*#today')
command! TodoWeek call Grep('^\s*--\s.*#week')
command! TodoNext call Grep('^\s*--\s.*#next')
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
  noremap <silent> <leader>tn :TodoNext<CR>

  noremap <silent> <leader>an :call mdtodo#toggle_tag('next')<CR>
  noremap <silent> <leader>aw :call mdtodo#remove_tag('today') \| call mdtodo#add_tag('week')<CR>
  noremap <silent> <leader>at :call mdtodo#remove_tag('week') \| call mdtodo#add_tag('today')<CR>

  setlocal list listchars=tab:\ \ ,trail:·
endfunction

augroup vimrc-markdown
	autocmd!
	autocmd FileType mkd call s:markdown_setup()
augroup END
autocmd Syntax mkd normal zR
