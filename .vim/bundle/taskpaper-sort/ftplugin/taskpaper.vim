
if exists("loaded_taskpaper_sort")
		finish
endif
let loaded_taskpaper_sort = 1
let s:sfile = expand("<sfile>:p:h")

execute "pyfile ".s:sfile."/sort.py"

fu! SortTasks()
python << EOF
cb = vim.current.buffer
node = parse_tasks(cb)
sort_tasks(node)
txt = flatten_tasks(node)
cb[:] = txt.split('\n')
EOF
endfu

command! SortTasks :call SortTasks()
map <silent> <buffer> <leader>s :call SortTasks()<CR>
