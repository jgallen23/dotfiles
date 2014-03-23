map <leader>a :TagbarToggle<CR>

let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'js',
    \ 'kinds'     : [
        \ 'f:function'
    \ ],
    \ 'sort'    : 0
\ }

let g:tagbar_type_html = {
    \ 'ctagstype' : 'html2',
    \ 'kinds'     : [
        \ 'i:id',
        \ 'c:class',
    \ ],
    \ 'sort'    : 0
\ }

let g:tagbar_type_less = {
    \ 'ctagstype' : 'less',
    \ 'kinds'     : [
        \ 'i:id',
        \ 'c:class',
        \ 't:tag',
        \ 'm:media',
    \ ],
    \ 'sort'    : 0
\ }
