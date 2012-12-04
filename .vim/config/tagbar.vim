let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_singleclick = 1
let g:tagbar_type_html = {
    \ 'ctagstype' : 'html2',
    \ 'kinds'     : [
        \ 'c:class',
        \ 'i:id'
    \ ]
\ }
let g:tagbar_autoshowtag = 1
nnoremap <silent> <leader>r :TagbarToggle<CR>
nnoremap <silent> <leader>s :TagbarShowTag<CR>
