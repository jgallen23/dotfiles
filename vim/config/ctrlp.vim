let g:ctrlp_working_path_mode = 0

"let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.svn$\|dist$\|bower_components$\|node_modules$',
	\ 'file': '\.DS_Store$\|\.jpg$\|\.png$\|\.jpeg$\|\.gif$\|\.svg$'
	\ }
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_height = 20
let g:ctrlp_by_filename = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_switch_buffer = 'e'

function! s:ctrlp_populate(query)
  let g:ctrlp_default_input = a:query
  CtrlP
  let g:ctrlp_default_input = ''
endfunction

function! CtrlPSearchNoIgnore(dir)
  let tmp = g:ctrlp_custom_ignore
  let g:ctrlp_custom_ignore = {}
  let dir = a:dir
  exec "CtrlP ".dir
  let g:ctrlp_custom_ignore = tmp
endfunction

command! FindSameFile :call s:ctrlp_populate(expand('%:t:r'))
nnoremap <silent> <leader>fm :CtrlPMRUFiles<CR>
nmap <silent> <leader>fs :FindSameFile<CR>
nmap <silent> <leader>fc :CtrlPCurFile<CR>
nmap <silent> <leader>x :CtrlPCurFile<CR>
nmap <silent> <leader>fd :CtrlPDir<CR>
nnoremap <silent> <space>  :CtrlPBuffer<CR>
nnoremap <silent> \ :CtrlP<CR>

command! FindDotfiles :CtrlP ~/.vim/
command! FindBowerFiles :call CtrlPSearchNoIgnore('bower_components')
command! FindNodeFiles :call CtrlPSearchNoIgnore('node_modules')
command! Cpr :CtrlPClearCache
