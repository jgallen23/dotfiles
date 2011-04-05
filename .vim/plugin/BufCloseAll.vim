
command! BufCloseAll :call BufCloseAll()

function! BufCloseAll()
	exe "enew"		
	exe "BufOnly"
endfunction
