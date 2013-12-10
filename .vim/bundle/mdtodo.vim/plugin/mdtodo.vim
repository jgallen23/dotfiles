command! TodoArchive call mdtodo#done_down()

function! mdtodo#toggle()
  let line = getline(".")
  if line =~# "-- "
    let line = substitute(line, "-- ", "++ ", "g")
  else
    let line = substitute(line, "++ ", "-- " ,"g")
  endif
  call setline(".", line)
endfunction

function! mdtodo#done_down()
  sort /++/
endfunction

function! mdtodo#add_tag(tag)
  let tag = ' #' . a:tag
  let cur_line = getline(".")
  let new_line = cur_line . tag
  call setline(".", new_line)
  return 1
endfunction

function! mdtodo#remove_tag(tag)
  let tag = ' #' . a:tag
  let cur_line = getline(".")
  let new_line = substitute(cur_line, tag, "", "g")
  call setline('.', new_line)
  return 1
endfunction

function! mdtodo#toggle_tag(tag)
  let tag = ' #' . a:tag
  let cur_line = getline(".")
  if cur_line =~# tag
    call mdtodo#remove_tag(a:tag)
  else
    call mdtodo#add_tag(a:tag)
  endif
  return 1
endfunction

function! mdtodo#syntax()
  syn match mdtodoActiveItem /^\s*--\s/
  hi link mdtodoActiveItem Keyword
  syn match mdtodoCompleteItem /^\s*++\s.*$/
  hi link mdtodoCompleteItem Comment

  syn match mdtodoTodayLine /#today/
  syn match mdtodoToday +--\%(.*#today\)\@=+
  hi link mdtodoToday Identifier
  syn match mdtodoWeek +--\%(.*#week\)\@=+
  hi link mdtodoWeek Label
  syn match mdtodoNext +--\%(.*#next\)\@=+
  hi link mdtodoNext Search

  syn match mdtodoTag /#\w\+/
  hi link mdtodoTag Comment

  syn cluster mkdNonListItem contains=htmlItalic,htmlBold,htmlBoldItalic,mkdFootnotes,mkdID,mkdURL,mkdLink,mkdLinkDef,mkdLineBreak,mkdBlockquote,mkdCode,mkdIndentCode,mkdListItem,mkdRule,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,mdtodoActiveItem,mdtodoCompleteItem,mdtodoToday,mdtodoWeek,mdtodoNext,mdtodoTag
  setlocal comments=b:*,b:+,b:-,b:--

endfunction

function! mdtodo#newline(offset)
  let lnum = line('.')
  let line = getline('.')
  let startlnum = lnum+a:offset
  call append(startlnum, '')
  execute startlnum+1
  if line =~# "[-+][-+] "
    call setline(startlnum+1, "-- ")
    execute "normal A"
  endif
  return "\<End>"

endfunction

function! mdtodo#mapping()
  if mapcheck("o", "n") == ''
    nmap <silent> <buffer> o :call mdtodo#newline(0)<CR>
    nmap <silent> <buffer> O :call mdtodo#newline(-1)<CR>
  endif
  if mapcheck("\<CR>", "i") == ''
    imap <silent> <buffer> <CR> :call mdtodo#newline()<CR>
  endif

endfunction


function! mdtodo#init()
  map <buffer> <silent> <leader><space> :call mdtodo#toggle()<CR>
  call mdtodo#mapping()
  call mdtodo#syntax()
endfunction

au BufLeave,CursorHold *.md :w

