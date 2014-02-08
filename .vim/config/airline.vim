"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

function! AirlineInit()
  let g:airline_section_x = airline#section#create_right(['%{&spell ? "spellon" : ""}'])
endfunction
autocmd VimEnter * call AirlineInit()
