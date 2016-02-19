function! GitWriteCommit()
  w
  q
  "call GitStatus()
endfunction
function! GitStatus()
  Gstatus
endfunction
function! GitCommit()
  Git add -p
  Git commit
endfunction
function! s:fugitive_setup()
	map <silent> <buffer> W :call GitWriteCommit()<CR>
	"map <buffer> au :Git add -u<CR>
	"map <buffer> dc :Git diff --cached<CR>
	"map <buffer> di :Git diff<CR>
endfunction
map <leader>gs :call GitStatus()<CR>
map <leader>gc :call GitCommit()<CR>
"map <leader>gp :Git push<CR>
"map <leader>gd :Git diff<CR>
augroup vimrc-git
	autocmd!
	autocmd FileType gitcommit call s:fugitive_setup()
augroup END


command! Gd Git! diff --no-ext-diff
command! Gdc Git! diff --no-ext-diff --cached

