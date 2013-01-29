function! g:ToggleNuMode() 
  if(&rnu == 1) 
    set nu 
  else 
    set rnu 
  endif 
endfunc 

nnoremap <silent> <leader>l :call g:ToggleNuMode()<cr>
