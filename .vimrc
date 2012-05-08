runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()
syntax on
filetype plugin indent on

if has("gui_running")
  set guifont=Monaco:h12
endif

set background=dark
set t_Co=256
colorscheme lucius

set ignorecase
set smartcase
set hidden
set textwidth=0 "disable auto wrapping
"set clipboard=unnamed "mac clipboard sync
set nobackup
set noswapfile
let mapleader=","
let maplocalleader="<"
set ruler
set wrap!
set guioptions-=T
set smartindent
set cmdheight=1
set laststatus=2
set statusline=[%l,%c\ %P%M]\ [%{getcwd()}%*\]%{fugitive#statusline()}\ %f\ %r%h%w
set number
set nohlsearch
nnoremap <leader>hl :set hlsearch!<CR>
set incsearch
set cursorline

"fix indent on #
inoremap # X<BS>#

set ts=2 sw=2

map <leader>v :e ~/.vimrc<CR><C-W>_
map <leader>b :Explore<CR>
map <silent> <leader>vr :source ~/.vimrc<CR>
map <leader>g :MyGrep 
map <leader>e :RunCode<CR>

"move around windows better
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

"search
map gs :%s:
map ss :s:

"indent
vmap <Tab> >gv
vmap <S-Tab> <gv
vmap <right> >gv
vmap <left> <gv

"start end of line
noremap H ^ 
noremap L g_

"git branch
let g:git_branch_status_head_current=1 
let g:git_branch_status_nogit=""
let g:git_branch_status_text=" " 
let g:git_branch_status_ignore_remotes=1

"go to previous file
nmap <BS> :e #<CR>
nmap <leader><leader> :e #<CR>

"javascript
au! BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript set et
"php
autocmd FileType php set noexpandtab

"markdown
function! s:markdown_setup()
	setlocal wrap
	setlocal noexpandtab
	noremap <buffer> <unique> <silent> k gk
	noremap <buffer> <unique> <silent> j gj
endfunction
augroup vimrc-markdown
	autocmd!
	autocmd FileType markdown call s:markdown_setup()
augroup END

"change cwd
command! CWD :cd %:p:h

"fix backspace
if !has('gui_running')
	set backspace=indent,eol,start
endif

"NerdTree
map <leader>t :NERDTree<CR>
map <leader>f :NERDTreeFind<CR>

"Redraw
map <leader>a :redraw!<CR>

"Taskpaper
au! BufRead,BufNewFile TODO setfiletype taskpaper
map <silent> <leader>r :e ~/Dropbox/Notes/personal.taskpaper<CR>
"map <silent> <leader>p :e ~/Dropbox/Notes/projects.taskpaper<CR>
map <silent> <leader>d :e ~/Dropbox/Notes/dm.taskpaper<CR>
fu! ShowTasks(dm)
	edit ~/Dropbox/Notes/personal.taskpaper
	call taskpaper#search_tag('today')
	cd %:p:h
	"vertical resize 50
	"setlocal autoread
	"rightbelow split ~/Dropbox/Notes/top/top_week.txt
	"setlocal autoread
	"autocmd CursorHold *.taskpaper checktime
endfu
command! Tasks :call ShowTasks(0)
command! TasksDM :call ShowTasks(1)
command! FindTasks :CtrlP ~/Dropbox/Notes

function! SearchForProject()
	set nofoldenable
	call taskpaper#go_to_project()
	call taskpaper#focus_project()
endfunction

function! GoToProject(project)
	set nofoldenable
	call taskpaper#search_project(split(a:project, ':'))
	call taskpaper#focus_project()
endfunction

function! s:taskpaper_setup()
	let g:task_paper_follow_move = 0
	let g:task_paper_search_hide_done = 1 
	noremap <silent> <up> :call SwapUp()<CR>
	noremap <silent> <down> :call SwapDown()<CR>
	nnoremap <buffer> <silent> <Leader>1 :<C-u>call taskpaper#swap_tags(['today','tomorrow','week'], ['today'])<CR>
	nnoremap <buffer> <silent> <Leader>2 :<C-u>call taskpaper#swap_tags(['today','tomorrow','week'], ['tomorrow'])<CR>
	nnoremap <buffer> <silent> <Leader>3 :<C-u>call taskpaper#swap_tags(['today','tomorrow','week'], ['week'])<CR>
	nnoremap <buffer> <silent> <Leader>0 :<C-u>call taskpaper#delete_tags(['today', 'tomorrow', 'week'])<CR>
	nnoremap <buffer> <silent> <Leader>e :<C-u>call taskpaper#toggle_tag('easy', '')<CR>
	nnoremap <buffer> <silent> <Leader>n :<C-u>call taskpaper#toggle_tag('next', '')<CR>
	nnoremap <buffer> <silent> [ :<C-u>call taskpaper#fold_projects()<CR>
	nnoremap <buffer> <silent> ] :<C-u>call taskpaper#focus_project()<CR>
	nnoremap <buffer> <silent> T :<C-u>call taskpaper#search_tag('today')<CR>
	nnoremap <buffer> <silent> W :call taskpaper#search_tag('\(tomorrow\\|week\)')<CR>
	nnoremap <buffer> <silent> <Leader>tM :<C-u>call taskpaper#search_tag('tomorrow')<CR>
	nnoremap <buffer> <silent> <Leader>tE :<C-u>call taskpaper#search_tag('easy')<CR>
	nnoremap <buffer> <silent> <Leader>tN :<C-u>call taskpaper#search_tag('next')<CR>
	nmap <buffer> <Leader><space> :<C-u>call taskpaper#toggle_tag('done', taskpaper#date())<CR>
	noremap <buffer> <silent> <Leader>j :<C-u>call SearchForProject()<CR>
	nnoremap <buffer> <silent> <Tab> :<C-u>call SearchForProject()<CR>
	nnoremap <buffer> <silent> <leader>pp :<C-u>call GoToProject('Personal')<CR>
	nnoremap <buffer> <silent> <leader>pk :<C-u>call GoToProject('Kindspark:Next')<CR>
	nnoremap <buffer> <silent> <leader>pv :<C-u>call GoToProject('Visits')<CR>
	nnoremap <buffer> <silent> <leader><up> :<C-u>call taskpaper#move_to_top()<CR>
	nnoremap <buffer> <silent> <leader><down> :<C-u>call taskpaper#move_to_bottom()<CR>
	au CursorHold personal.taskpaper :w


endfunction
let g:task_paper_styles={
	\ 'next': 'ctermfg=167', 
	\ 'tomorrow': 'ctermfg=182', 
	\ 'week': 'ctermfg=187', 
	\ 'today': 'ctermfg=150'
	\ }

augroup vimrc-taskpaper
	autocmd!
	autocmd FileType taskpaper call s:taskpaper_setup()
augroup END
"
"ctrlp
let g:ctrlp_working_path_mode = 0
nnoremap <silent> <space>  :CtrlPBuffer<CR>
nnoremap <silent> \ :CtrlP<CR>
nnoremap <silent> <Tab> :CtrlPCurFile<CR>
command! FindBlog :CtrlP ~/Dropbox/jga.me
let g:ctrlp_extensions = ['tag']
nnoremap <silent> cv  :CtrlPTag<CR>
let g:ctrlp_custom_ignore = {
	\ 'dir':  'node_modules$\|\.git$\|compressed$',
	\ 'file': '\.DS_Store$\|\.jpg$\|\.png$\|\.jpeg$\|\.gif$\|\.svg$'
	\ }
let g:ctrlp_regexp_search = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0

"easy motion
let g:EasyMotion_mapping_w = '<leader>w'

"snippets
command! ReloadSnippets :call ReloadSnippets(&ft)
command! EditSnippets :exec(":e ".split(snippets_dir, ',')[0].&ft.".snippets")

"unit tests
map <leader>mt :RunTests<CR>

"vim room
let g:vimroom_ctermbackground = "black"

let syntastic_mode_map = { 'mode': 'active',
												 \ 'active_filetypes': ['javascript', 'css', 'html'],
												 \ 'passive_filetypes': ['php'] }

"tabs
map <leader>{ :tabprevious<CR>
map <leader>} :tabnext<CR>

"paste
nmap <leader>p :set paste!<BAR>:set paste?<CR>

"indent guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
"let g:indent_guides_guide_size = 1

"fugitive
function! GitWriteCommit()
	w
	bd
endfunction
function! s:fugitive_setup()
	map <buffer> W :call GitWriteCommit()<CR>
	map <buffer> au :Git add -u<CR>
	map <buffer> dc :Git diff --cached<CR>
endfunction
function! GitShowStatus()
	execute 'Gstatus'
	res +20
endfunction
map <leader>gs :call GitShowStatus()<CR>
map <leader>gp :Git push<CR>
map <leader>gd :Git diff<CR>
augroup vimrc-git
	autocmd!
	autocmd FileType gitcommit call s:fugitive_setup()
augroup END
