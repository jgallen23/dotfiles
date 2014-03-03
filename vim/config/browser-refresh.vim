function! g:BrowserRefresh()
  let tmp = system("browser-refresh -b chrome-canary")
endfunc

function! g:BrowserRefreshCSS()
  let tmp = system("browser-refresh -b chrome-canary --css")
endfunc

map <silent> <leader>r :call g:BrowserRefresh()<CR>
map <silent> <leader>rc :call g:BrowserRefreshCSS()<CR>
