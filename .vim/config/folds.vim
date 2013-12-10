function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
    normal zR
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen


autocmd Syntax html,css,less setlocal foldmethod=indent
autocmd Syntax html,css,less normal zR

"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

map zy :normal zMzv<CR>
