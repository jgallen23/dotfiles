let g:grep_excludes_dir=['.git', 'node_modules', '_compiled', 'dist', '.meteor', '.svn']
map <leader>gr :Grep
map <leader>gw :call Grep(expand('<cword>'))<CR>
