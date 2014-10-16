map <leader>a :TagbarToggle<CR>
let g:tagbar_autoclose = 1

let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'js',
    \ 'kinds'     : [
        \ 'f:function',
        \ 'd:describe',
        \ 't:it',
        \ 'e:exports',
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
