command! ReloadSnippets :call ReloadSnippets(&ft)
command! EditSnippets :exec(":e ".split(snippets_dir, ',')[0].&ft.".snippets")
let g:snippets_dir = "~/.vim/snips/"
