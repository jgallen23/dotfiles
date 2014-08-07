let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

function! AirlineInit()
  let spc = g:airline_symbols.space
  let g:airline_section_x = airline#section#create_right(['%{&spell ? "spellon" : ""}'])
  let g:airline_section_z = airline#section#create(['%3p%%'.spc, 'linenr', ':%3c ', ': %3L'])
endfunction
autocmd VimEnter * call AirlineInit()
