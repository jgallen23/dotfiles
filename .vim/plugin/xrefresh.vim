function! XRefreshEnable() 
	let g:XRefreshEnabled=1
endfunction

function! XRefreshDisable() 
	let g:XRefreshEnabled=0
endfunction

function! XRefreshUpdate()
	if exists("g:XRefreshEnabled") && g:XRefreshEnabled == 1
		call system("echo !!refresh | nc localhost 41259")
	endif
endfunction
autocmd BufWritePost * :call XRefreshUpdate()
