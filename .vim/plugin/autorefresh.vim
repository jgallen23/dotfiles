function! AutoRefreshEnable() 
	let g:AutoRefreshEnabled=1
endfunction

function! AutoRefreshDisable() 
	let g:AutoRefreshEnabled=0
endfunction

function! AutoRefreshToggle()
	if exists("g:AutoRefreshEnabled") && g:AutoRefreshEnabled == 1
		call AutoRefreshDisable()
	else
		call AutoRefreshEnable()
	endif
endfunction

function! AutoRefreshUpdate()
	if exists("g:AutoRefreshEnabled") && g:AutoRefreshEnabled == 1
		call system("echo !!refresh | nc localhost 41259")
	endif
endfunction

function! AutoRefreshStatusLine()
	if exists("g:AutoRefreshEnabled") && g:AutoRefreshEnabled == 1
		return '[AutoRefresh]'
	else
		return ''
endfunction
autocmd BufWritePost * :call AutoRefreshUpdate()
map <Leader>ar :call AutoRefreshToggle()<CR>

