function! g:BrowserRefresh()
  let tmp = system("browser-refresh")
endfunc

function! g:BrowserRefreshCSS()
  let tmp = system("browser-refresh --css")
endfunc

map <silent> <leader>r :call g:BrowserRefresh()<CR>
map <silent> <leader>rc :call g:BrowserRefreshCSS()<CR>
