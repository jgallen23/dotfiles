command! TodoToday call Grep('^\s*--\s.*#today')
command! TodoWeek call Grep('^\s*--\s.*#week')
command! TodoNext call Grep('^\s*--\s.*#next')
command! TodoAll call Grep('^\s*--\s')
command! Todos call s:open_todos()
command! TodoArchive call marktodo#done_down()

function! s:open_todos()
  execute 'cd '.resolve(expand('~/Dropbox/Notes'))
  e tasks/computer.md
  NERDTree
endfunction

function! s:markdown_setup()
	setlocal wrap
	setlocal noexpandtab
  noremap <buffer> <silent> k gk
  noremap <buffer> <silent> j gj
  noremap <buffer> <silent> <up> :call SwapUp()<CR>
  noremap <buffer> <silent> <down> :call SwapDown()<CR>
  noremap <silent> <leader>ft :TodoToday<CR>
  noremap <silent> <leader>fw :TodoWeek<CR>
  noremap <silent> <leader>fa :TodoAll<CR>
  noremap <silent> <leader>fn :TodoNext<CR>

  noremap <silent> <leader>tn :call marktodo#toggle_tag('next')<CR>
  noremap <silent> <leader>tw :call marktodo#remove_tag('today') \| call marktodo#toggle_tag('week')<CR>
  noremap <silent> <leader>tt :call marktodo#remove_tag('week') \| call marktodo#toggle_tag('today')<CR>

  nmap <buffer> <CR> :OpenUrl<CR>

  setlocal list listchars=tab:\ \ ,trail:·
endfunction

augroup vimrc-markdown
	autocmd!
	autocmd FileType mkd call s:markdown_setup()
augroup END
autocmd Syntax mkd normal zR
