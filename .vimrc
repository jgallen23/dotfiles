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
set clipboard=unnamed "mac clipboard sync
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
set statusline=[%l,%c\ %P%M]\ [%{getcwd()}%*\][%{GitBranchInfoTokens()[0]}]\ %f\ %r%h%w
set number
set hlsearch
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

"Redraw
map <leader>a :redraw!<CR>

"Taskpaper
au! BufRead,BufNewFile TODO setfiletype taskpaper
map <silent> <leader>r :e ~/Dropbox/Notes/personal.taskpaper<CR>
map <silent> <leader>p :e ~/Dropbox/Notes/projects.taskpaper<CR>
map <silent> <leader>d :e ~/Dropbox/Notes/dm.taskpaper<CR>
fu! ShowTasks()
	edit ~/Dropbox/Notes/dm.taskpaper
	call taskpaper#search_tag('today')
	cd %:p:h
	vsplit ~/Dropbox/Notes/personal.taskpaper
	call taskpaper#search_tag('today')
	"vertical resize 50
	"setlocal autoread
	"rightbelow split ~/Dropbox/Notes/top/top_week.txt
	"setlocal autoread
	"autocmd CursorHold *.taskpaper checktime
endfu
command! Tasks :call ShowTasks()
command! FindTasks :CtrlP ~/Dropbox/Notes

function! s:taskpaper_setup()
	let g:task_paper_follow_move = 0
	noremap <silent> <up> :call SwapUp()<CR>
	noremap <silent> <down> :call SwapDown()<CR>
	nnoremap <buffer> <silent> <Leader>[ :<C-u>call taskpaper#fold_projects()<CR>
	nnoremap <buffer> <silent> <Leader>] :<C-u>call taskpaper#focus_project()<CR>
	nnoremap <buffer> <silent> <Leader>tM :<C-u>call taskpaper#search_tag('tomorrow')<CR>
	nmap <buffer> <Leader><space> :<C-u>call taskpaper#toggle_tag('done', taskpaper#date())<CR>
	cnoremap <buffer> <silent> <Leader>y :<C-u>call taskpaper#cycle_tags('today', 'tomorrow', '')<CR>

endfunction

augroup vimrc-taskpaper
	autocmd!
	autocmd FileType taskpaper call s:taskpaper_setup()
augroup END
"
"ctrlp
let g:ctrlp_working_path_mode = 0
nnoremap <silent> <space>  :CtrlPMRUFiles<CR>
nnoremap <silent> \ :CtrlP<CR>
nnoremap <silent> <Tab> :CtrlPCurFile<CR>
command! FindBlog :CtrlP ~/Dropbox/jga.me
let g:ctrlp_extensions = ['tag']
nnoremap <silent> cv  :CtrlPTag<CR>
let g:ctrlp_custom_ignore = 'dist\|node_modules\|DS_Store\|git\|compressed'
let g:ctrlp_regexp_search = 1
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
map <leader>< :tabprevious<CR>
map <leader>> :tabnext<CR>
map <leader>n :tabnew<CR>
map <leader>l :tabclose<CR>
