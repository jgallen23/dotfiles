let g:marktodo_search = ''

function! s:default_search()
  if g:marktodo_search != ''
    call s:search(g:marktodo_search)
  endif
endfunction

function! s:search(tag)
  let g:marktodo_search = a:tag
  call Grep('^\s*--\s.*#'.a:tag)
  wincmd k
endfunction

function! s:update_search()
  call system("./scripts/searches")
endfunction

command! TodoToday call s:search('today')
command! TodoWeek call s:search('week')
command! TodoNext call s:search('next')
command! TodoAll call Grep('^\s*--\s')
command! Todos call s:open_todos()
command! TodoArchive call marktodo#done_down()
command! TodoSearch call s:default_search()
command! TodoUpdateSearch call s:update_search()



command! -nargs=1 TodoSearchTag call s:search(<f-args>)

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
  noremap <silent> <leader>a :TodoArchive<CR>

  noremap <silent> <leader>tn :call marktodo#toggle_tag('next')<CR>
  noremap <silent> <leader>tw :call marktodo#remove_tag('tomorrow') \| call marktodo#remove_tag('today') \| call marktodo#toggle_tag('week')<CR>
  noremap <silent> <leader>tt :call marktodo#remove_tag('tomorrow') \| call marktodo#remove_tag('week') \| call marktodo#toggle_tag('today')<CR>
  noremap <silent> <leader>tm :call marktodo#remove_tag('today') \| call marktodo#remove_tag('week') \| call marktodo#toggle_tag('tomorrow')<CR>

  noremap <silent> <leader>s :TodoUpdateSearch<CR>


  nmap <buffer> <CR> :OpenUrl<CR>

  setlocal list listchars=tab:\ \ ,trail:·
  setlocal spell
endfunction

augroup vimrc-markdown
	autocmd!
	autocmd FileType mkd call s:markdown_setup()
augroup END
"au BufWritePost *.md :TodoSearch
let g:vim_markdown_folding_disabled=1
