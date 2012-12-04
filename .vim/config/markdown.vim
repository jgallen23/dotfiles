function! s:markdown_setup()
	setlocal wrap
	setlocal noexpandtab
	noremap <buffer> <unique> <silent> k gk
	noremap <buffer> <unique> <silent> j gj
endfunction
augroup vimrc-markdown
	autocmd!
	autocmd FileType markdown call s:markdown_setup()
augroup END
