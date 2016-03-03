let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_section_b = '%{getcwd()} | %{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_left_sep=''
let g:airline_right_sep=''
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

function! AirlineInit()
  let spc = g:airline_symbols.space
  let g:airline_section_x = airline#section#create_right(['%{&spell ? "spellon" : ""}'])
  let g:airline_section_z = airline#section#create(['%3p%%'.spc, 'linenr', ':%3c ', ': %3L'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
