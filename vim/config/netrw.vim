map <leader>- :call ExploreAndFocus()<cr>
map <C-e> :call ExploreAndFocus()<cr>
let g:netrw_liststyle=0         " thin (change to 3 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_alto=0              " open files on right
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically
let g:netrw_winsize=75
"let g:netrw_browse_split=4

function! ExploreAndFocus()
  execute 'Explore | call search(' . string(expand('%:t')) . ')'
endfunction
