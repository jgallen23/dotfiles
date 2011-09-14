syntax match VimwikiTaskPri /.*(.)/
hi def link VimwikiTaskPri Comment 
syntax match VimwikiTask1 /.*(1)/
hi VimwikiTask1 ctermfg=red guifg=red
syntax match VimwikiTask2 /.*(2)/
hi VimwikiTask2 ctermfg=yellow guifg=yellow
syntax match VimwikiTask3 /.*(3)/
hi VimwikiTask3 ctermfg=green guifg=green
syntax match VimwikiTask4 /.*(4)/
hi VimwikiTask4 ctermfg=44 guifg=#00d7d7
syntax match VimwikiTask5 /.*(5)/
hi VimwikiTask5 ctermfg=130 guifg=#af5f00
