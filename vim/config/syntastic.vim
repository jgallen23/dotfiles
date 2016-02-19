let syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['javascript', 'css', 'yaml', 'json', 'php'],
      \ 'passive_filetypes': ['html'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
