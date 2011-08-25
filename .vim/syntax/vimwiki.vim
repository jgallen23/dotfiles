syntax match VimwikiTaskPri /.*(.)/
hi def link VimwikiTaskPri Comment 
syntax match VimwikiTaskHi /.*(1)/
hi VimwikiTaskHi ctermfg=red guifg=red
syntax match VimwikiTaskMed /.*(2)/
hi VimwikiTaskMed ctermfg=yellow guifg=yellow
syntax match VimwikiTaskLow /.*(3)/
hi VimwikiTaskLow ctermfg=green guifg=green

