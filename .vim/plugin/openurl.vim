function! s:OpenUrl()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;\)]*')
  echo s:uri
  if s:uri != ""
    silent exec "!open '".s:uri."'"
    redraw!
  else
    echo "No URI found in line."
  endif
endfunction
command! OpenUrl call s:OpenUrl()
