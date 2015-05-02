let g:grep_height = 10
let g:grep_excludes_dir=['.git', 'bower_components', 'node_modules', '_compiled', 'dist', '.meteor', '.svn', '_dist']
"map <leader>gr :Grep 
map <leader>gw :call Grep(expand('<cword>'))<CR>
map <leader>g :Grep 
vmap <leader>gv :GrepSelection<CR>

