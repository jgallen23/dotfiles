
function! s:ClearPriority()
  let line = getline(".")
  let repl = substitute(line, "] (.)", "]", "g")
  call setline(".", repl)
endfunction
function! s:SetPriority(val)
  call s:ClearPriority()
  let line = getline(".")
  let priority = "] (".a:val.") "
  let repl = substitute(line, "\] ", priority, "g")
  call setline(".", repl)
endfunction

noremap <silent><buffer> 1 :call <SID>SetPriority(1)<CR>
noremap <silent><buffer> 2 :call <SID>SetPriority(2)<CR>
noremap <silent><buffer> 3 :call <SID>SetPriority(3)<CR>
noremap <silent><buffer> 4 :call <SID>SetPriority(4)<CR>
noremap <silent><buffer> 5 :call <SID>SetPriority(5)<CR>
noremap <silent><buffer> 0 :call <SID>ClearPriority()<CR>

vmap <buffer> s :sort<CR>

function! GetTopTasks()
  let cmd = 'grep -r "\[ \].(1" * | grep -v search/ | sed "s/\(.*\).wiki.*- \[ \].(1) \(.*\)$/\2 - \[\[..\\/\1\]\]/" | sort > ~/Dropbox/Notes/projects/search/top.wiki'
  call system(cmd)
  execute "edit"
endfunction
function! GetTasksForWeek()
  let cmd = 'grep -r "\[ \].(" * | grep -v search/ | sed "s/\(.*\).wiki.*- \[ \].\(.*\)$/\2 - \[\[..\\/\1\]\]/" | sort > ~/Dropbox/Notes/projects/search/week.wiki'
  call system(cmd)
  execute "edit"
endfunction

autocmd BufEnter,BufNew week.wiki,top.wiki setlocal autoread 
autocmd BufEnter top.wiki silent! call GetTopTasks()<CR>
autocmd BufEnter week.wiki silent! call GetTasksForWeek()<CR>

function! GetProject()
  let s:currentProjectArr = searchpos('= .* =', 'cnb')
  let s:currentProject = s:currentProjectArr[0] + 1
  let s:nextProjectArr = searchpos('= .* =', 'n')
  let s:nextProject = s:nextProjectArr[0] - 1
  if s:currentProject > s:nextProject
    let s:nextProject = line("$")
  endif
  "echo s:currentProject
  "echo s:nextProject
  return [s:currentProject,s:nextProject]
endfunction

function! SortProject()
  let s:proj = GetProject()
  execute s:proj[0].','.s:proj[1] .' sort'
endfunction
noremap <silent> <leader>s :call SortProject()<CR>


function! MoveDoneDown()
  let s:proj = GetProject()
  execute s:proj[0].','.s:proj[1] .' sort /\[X\]/'
endfunction
noremap <silent> <leader>d :call MoveDoneDown()<CR>


autocmd BufLeave *.wiki silent! wall

function! FindAllTasks(path)
	execute "noautocmd vimgrep / ]/j ".a:path." | vertical cw | vertical resize ".s:width
endfunction
function! FindTasks(pri, path)
  let s:columns = &columns
  let s:width = s:columns/2
  execute "noautocmd silent vimgrep / ] (".a:pri.")/j ".a:path." | vertical cw | vertical resize ".s:width
  "execute "noautocmd silent vimgrep / ] (".a:pri.")/j ".a:path." | vertical cw | w search/priority_".a:pri.".txt"
endfunction

map <leader>1 :call FindTasks(1, "~/Dropbox/Notes/projects/**/*.wiki")<CR>
map <leader>2 :call FindTasks(2, "~/Dropbox/Notes/projects/**/*.wiki")<CR>
map <leader>3 :call FindTasks(3, "~/Dropbox/Notes/projects/**/*.wiki")<CR>
map <leader>4 :call FindTasks(4, "~/Dropbox/Notes/projects/**/*.wiki")<CR>
map <leader>5 :call FindTasks(5, "~/Dropbox/Notes/projects/**/*.wiki")<CR>
map <leader>` :call FindTasks('.', "~/Dropbox/Notes/projects/**/*.wiki")<CR>
map <leader>a :call FindAllTasks("~/Dropbox/Notes/projects/**/*.wiki")<CR>
map <leader>p1 :call FindTasks(1, "~/Dropbox/Notes/projects/*")<CR>
map <leader>p2 :call FindTasks(2, "~/Dropbox/Notes/projects/*")<CR>
map <leader>p3 :call FindTasks(3, "~/Dropbox/Notes/projects/*")<CR>
map <leader>p4 :call FindTasks(4, "~/Dropbox/Notes/projects/*")<CR>
map <leader>p5 :call FindTasks(5, "~/Dropbox/Notes/projects/*")<CR>
map <leader>p` :call FindTasks('.', "~/Dropbox/Notes/projects/*")<CR>
map <leader>pa :call FindAllTasks("~/Dropbox/Notes/projects/*")<CR>
map <leader>w1 :call FindTasks(1, "~/Dropbox/Notes/projects/demandmedia/**/*.wiki")<CR>
map <leader>w2 :call FindTasks(2, "~/Dropbox/Notes/projects/demandmedia/**/*.wiki")<CR>
map <leader>w3 :call FindTasks(3, "~/Dropbox/Notes/projects/demandmedia/**/*.wiki")<CR>
map <leader>w4 :call FindTasks(4, "~/Dropbox/Notes/projects/demandmedia/**/*.wiki")<CR>
map <leader>w5 :call FindTasks(5, "~/Dropbox/Notes/projects/demandmedia/**/*.wiki")<CR>
map <leader>w` :call FindTasks('.', "~/Dropbox/Notes/projects/demandmedia/**/*.wiki")<CR>
map <leader>wa :call FindAllTasks("~/Dropbox/Notes/projects/demandmedia/**/*.wiki")<CR>

