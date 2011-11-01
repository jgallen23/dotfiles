
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

noremap <silent><buffer> <leader>1 :call <SID>SetPriority(1)<CR>
noremap <silent><buffer> <leader>2 :call <SID>SetPriority(2)<CR>
noremap <silent><buffer> <leader>3 :call <SID>SetPriority(3)<CR>
noremap <silent><buffer> <leader>4 :call <SID>SetPriority(4)<CR>
noremap <silent><buffer> <leader>5 :call <SID>SetPriority(5)<CR>
noremap <silent><buffer> <leader>6 :call <SID>SetPriority(6)<CR>
noremap <silent><buffer> <leader>0 :call <SID>ClearPriority()<CR>

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
  if s:currentProject > line(".")
	let s:currentProject = 1
  endif
  if s:currentProject > s:nextProject
    let s:nextProject = line("$")
  endif
  "echo s:currentProject
  "echo s:nextProject
  return [s:currentProject,s:nextProject]
endfunction


python << EOF
import re
def indent_count(s):
	i = 0
	for c in s:
		if c == "\t":
			i += 1
		else:
			break
	return i

def sort(tasks):
	def sort_tasks(a, b):
		c = cmp(a['complete'], b['complete'])
		if c == 0 and not a['complete']:
			c = cmp(a['priority'], b['priority'])
		return c

	tasks = sorted(tasks, cmp=sort_tasks)
	for task in tasks:
		task['subtasks'] = sort(task['subtasks'])
	return tasks


def tasks_array(tasks, arr):
	for task in tasks:
		arr.append(task['name'])
		tasks_array(task['subtasks'], arr)

def parse(lines):
	last_task = None
	parent = []
	for line in lines:
		if not line:
			continue
		task = { 'indent': indent_count(line), 'name': line, 'subtasks': [] }

		p = re.search("\((\d)\)", line)
		if p:
			pri = int(p.groups()[0])
		else:
			pri = 99
		task['priority'] = pri

		task['complete'] = True if len(re.findall('\[X\]', line)) == 1 else False
		if last_task:
			if last_task['indent'] < task['indent']:
				last_task['subtasks'].append(task)
				task['parent'] = last_task
			elif last_task['indent'] == task['indent']:
				if last_task.has_key('parent'):
					last_task['parent']['subtasks'].append(task)
					task['parent'] = last_task['parent']
				else:
					parent.append(task)
			else:
				if last_task['parent'].has_key('parent'):
					last_task['parent']['parent']['subtasks'].append(task)
					task['parent'] = last_task['parent']['parent']
				else:
					parent.append(task)
		else:
			parent.append(task)
		last_task = task
	return parent
EOF
function! SortProject()
python << EOF
proj = vim.eval('GetProject()')
buff = vim.current.buffer
start = int(proj[0]) - 1
end = int(proj[1]) - 1
lines = buff[start:end]
t = parse(lines)
t = sort(t)
a = []
tasks_array(t, a)
buff[start:end] = a
EOF
endfunction
noremap <silent> <leader>s :call SortProject()<CR>
noremap <silent><buffer> <up> :call SwapUp()<CR>
noremap <silent><buffer> <down> :call SwapDown()<CR>
autocmd BufLeave *.wiki silent! wall
function! FindAllTasks(path)
	execute "noautocmd vimgrep / ]/j ".a:path." | vertical cw | vertical resize ".s:width
endfunction
function! FindTasks(path, pri)
  let s:columns = &columns
  let s:width = s:columns/2
  execute "noautocmd silent vimgrep / ] (".a:pri.")/j ".a:path." | vertical cw | vertical resize ".s:width
endfunction
function! FindTasksSorted(path, pri)
	let cmd = 'grep -rsinI " ] ('.a:pri.')" '.a:path.' | tr -d "\t" | sed -E "s/(.*wiki):([0-9]+):-(.*)/\3;;\1:\2/" | sort'
	let out = system(cmd)
	let tmpfile = "top.tmp"
	"tempname()
	exe "redir! > " . tmpfile
	silent echon out
	redir END
	"set efm=%m||%f:%\\s%#%l
	let old_efm = &efm
	set efm=%m;;%f:%l
	execute "silent! cgetfile " . tmpfile
	let &efm = old_efm
	call delete(tmpfile)
	let s:columns = &columns
	let s:width = s:columns/2
 	execute "vertical cw | vertical resize ".s:width
endfunction

map <silent> <leader>f1 :call FindTasks("**/*.wiki", 1)<CR>
map <silent> <leader>f2 :call FindTasks("**/*.wiki", 2)<CR>
map <silent> <leader>f3 :call FindTasks("**/*.wiki", 3)<CR>
map <silent> <leader>f4 :call FindTasks("**/*.wiki", 4)<CR>
map <silent> <leader>f5 :call FindTasks("**/*.wiki", 5)<CR>
map <silent> <leader>f6 :call FindTasks("**/*.wiki", 6)<CR>
"map <silent> <leader>` :call FindTasksSorted("*", '.')<CR>
"map <silent> <leader>k :call FindTasksSorted("*", '[12345]')<CR>
"map <silent> <leader>t :call FindTasksSorted("*", '[123]')<CR>
"map <silent> <leader>a :call FindAllTasks("**/*.wiki")<CR>
map <silent> <leader>` :call FindTasksSorted("* \| grep -v demandmedia/", '.')<CR>
map <silent> <leader>k :call FindTasksSorted("* \| grep -v demandmedia/", '[12345]')<CR>
map <silent> <leader>t :call FindTasksSorted("* \| grep -v demandmedia/", '[123]')<CR>
map <silent> <leader>a :call FindAllTasks("**/*.wiki")<CR>
map <silent> <leader>p :e ~/Dropbox/Notes/projects/index.wiki<CR>
map <silent> <leader>i :e ~/Dropbox/Notes/projects/ideas/index.wiki<CR>
