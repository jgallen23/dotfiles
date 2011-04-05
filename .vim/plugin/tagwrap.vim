" These mappings and TagSelection function will allow you to place
" an XML tag around either the current word, or the current selected
" text.
" If the visual select is on a single line, the tag is wrapped
" around the text <this>way</this>. If the visual select
" extends over multiple lines, the tag is wrapped around the text
" <this>
" way
" </this>
"
" When you are prompted for the tag name, you can enter:
" Tag name? p class="classname" attri="bute"
" The select is wrapped with:
" <p class="classname" attri="bute">
" Your selection
" </p>
" Notice the attributes have been stripped from the closing tag.
"
" Use nmap, not nnoremap, since we do want to use an existing mapping.
nmap ,,, viw,,,
vnoremap ,,, <Esc>:call TagSelection()<CR>

function! TagSelection()
  let tag = input("Tag name (include attributes)? ")
  if strlen(tag) == 0
    return
  endif

  " Save
  let saveB = @b
  " <C-R> seems to automatically reindent the line for some filetypes
  " this will disable it until we have applied our changes
  let saveIndent = &indentexpr
  let curl = line(".")
  let curc = col(".")
  let &indentexpr = ''

  " If the visual selection is over multiple lines, then place the
  " data between the tags on newlines:
  "   <tag>
  "   data
  "   </tag>
  let newline = ''
  if getline("'>") != getline("'<")
    let newline = "\n"
    let curl = line("'>")
  endif

  " Strip off all but the first word in the tag for the end tag
  let @b = newline . substitute(tag, '^[ \t"]*\(\<\S*\>\).*', '<\/\1>\e', "")
  let curc = curc + strlen(@b)
  exec "normal `>a\<C-R>b"
  let @b = substitute(tag, '^[ \t"]*\(\<.*\)', '<\1>\e', "") . newline
  let curc = curc + strlen(@b)
  exec "normal `<i\<C-R>b"

  " Now format the area
  exec "normal `<V'>j="

  " Restore
  let @b = saveB
  let &indentexpr = saveIndent
  call cursor(curl, curc)
endfunction

