
if exists("g:loaded_mdtodo")
	finish
endif
let g:loaded_mdtodo = 1

augroup mdtodo
	" Call linemove on cursor move events in PHP files
	"autocmd CursorMoved,CursorMovedI *.md call phtmlSwitch#linemove()

	" Call linemove on opening file PHP files
	autocmd BufRead *.md call mdtodo#init()
augroup END
