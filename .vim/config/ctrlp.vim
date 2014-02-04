let g:ctrlp_working_path_mode = 0

"let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = {
	\ 'dir':  'node_modules$\|\.git$\|\.meteor$\|\.svn$\|dist$',
	\ 'file': '\.DS_Store$\|\.jpg$\|\.png$\|\.jpeg$\|\.gif$\|\.svg$'
	\ }
let g:ctrlp_regexp_search = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_height = 20
let g:ctrlp_by_filename = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_switch_buffer = 'e'

command! CNM :CtrlP node_modules

function! s:ctrlp_populate(query)
  let g:ctrlp_default_input = a:query
  CtrlP
  let g:ctrlp_default_input = ''
endfunction

command! FindReadme :call s:ctrlp_populate("readme")

command! FindSameFile :call s:ctrlp_populate(expand('%:t:r'))
nnoremap <silent> <leader>fm :CtrlPMRUFiles<CR>
nmap <silent> <leader>fs :FindSameFile<CR>
nmap <silent> <leader>fn :CtrlP node_modules<CR>
nmap <silent> <leader>fc :CtrlPCurFile<CR>
nmap <silent> <leader>fd :CtrlPDir<CR>
nnoremap <silent> <space>  :CtrlPBuffer<CR>
nnoremap <silent> \ :CtrlP<CR>

command! FindNotes :CtrlP ~/Dropbox/Notes
