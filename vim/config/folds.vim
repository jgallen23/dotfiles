
"autocmd Syntax html,css,less setlocal foldmethod=indent
"autocmd Syntax html,css,less normal zR

"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

map zy :normal zMzvzczO<CR>

augroup jsfolding
  autocmd!
  autocmd FileType javascript setlocal foldenable|setlocal foldmethod=syntax
augroup END
