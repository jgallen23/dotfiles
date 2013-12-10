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

function! mdtodo#syntax()
  syn match mdtodoActiveItem /^\s*--\s/
  hi link mdtodoActiveItem Identifier
  syn match mdtodoCompleteItem /^\s*++\s.*$/
  hi link mdtodoCompleteItem Comment
  syn cluster mkdNonListItem contains=htmlItalic,htmlBold,htmlBoldItalic,mkdFootnotes,mkdID,mkdURL,mkdLink,mkdLinkDef,mkdLineBreak,mkdBlockquote,mkdCode,mkdIndentCode,mkdListItem,mkdRule,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,mdtodoActiveItem,mdtodoCompleteItem
  setlocal comments=b:*,b:+,b:-,b:--

endfunction


function! mdtodo#init()
  map <buffer> <silent> <leader><space> :call mdtodo#toggle()<CR>
  call mdtodo#syntax()
endfunction

au BufLeave,CursorHold *.md :w

