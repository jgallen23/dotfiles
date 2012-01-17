runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()
syntax on
filetype plugin indent on

if has("gui_running")
  set guifont=Monaco:h12
endif

set background=dark
colorscheme lucius
set t_Co=256

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

"fuzzy finder
map ,fr :FufRenewCache<CR>
let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.pyc$|\.jpg$|\.png$|\.gif$|/media/.*|ui/compressed/'
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|jpg|png|gif|pyc|DS_Store|designer.cs)$|node_modules|vendor|dist|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
nnoremap <silent> sd  :FufDir ~/.shortcuts/<CR>
nnoremap <silent> cd  :FufDirWithFullCwd<CR>
nnoremap <silent> cf  :FufFileWithCurrentBufferDir<CR>
"nnoremap <silent> cv  :FufTag<CR>
"nnoremap <silent> <space>  :FufBuffer<CR>
"nnoremap <silent> <tab>  :FufFile<CR>
"nnoremap <silent> \ :FufCoverageFile<CR>

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

"javascript
autocmd FileType javascript set et
"php
autocmd FileType php set et!

"change cwd
command! CWD :cd %:p:h

"fix backspace
if !has('gui_running')
  set backspace=indent,eol,start
endif

"NerdTree
map <leader>t :NERDTree<CR>

"Tasks
"nnoremap <silent> <leader>k :e ~/Dropbox/Notes/Index.taskpaper;CWD<CR>

"Redraw
map <leader>r :redraw!<CR>

"Taskpaper
"autocmd BufWinEnter,BufWritePost *.taskpaper call FindTasksByPriority(expand('%'), '[123]', 1)
map <silent> <leader>r :e ~/Dropbox/Notes/_personal.taskpaper<CR>
map <silent> <leader>p :e ~/Dropbox/Notes/_projects.taskpaper<CR>
map <silent> <leader>d :e ~/Dropbox/Notes/_dm.taskpaper<CR>
map <silent> <leader>i :e ~/Dropbox/Notes/projects/_ideas/index.taskpaper<CR>
fu! ShowTopTasks()
	edit ~/Dropbox/Notes/_Personal.taskpaper
	vsplit ~/Dropbox/Notes/_top.txt
	vertical resize 50
	setlocal autoread
	rightbelow split ~/Dropbox/Notes/_top_week.txt
	setlocal autoread
	autocmd CursorHold *.taskpaper checktime
endfu
map <silent> <leader>k :call ShowTopTasks()<CR>
"find top
"map <silent> <leader>k :call FindTasksByPriority(expand('%'), '.', 1)<CR>
"map <silent> <leader>t :call FindTasksByPriority(expand('%'), '[123]', 1)<CR>

"ctrlp
let g:ctrlp_working_path_mode = 0
nnoremap <silent> <space>  :CtrlPBuffer<CR>
nnoremap <silent> \ :CtrlP<CR>
nnoremap <silent> <Tab> :CtrlPCurFile<CR>
command! BlogFiles :CtrlP ~/Dropbox/jga.me
let g:ctrlp_extensions = ['tag']
nnoremap <silent> cv  :CtrlPTag<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|compressed'

let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
command! Tasks :CtrlP ~/Dropbox/Notes

"easy motion
let g:EasyMotion_mapping_w = '<leader>w'

"snippets
command! ReloadSnippets :call ReloadSnippets(&ft)
command! EditSnippets :exec(":e ".split(snippets_dir, ',')[0].&ft.".snippets")

"unit tests
map <leader>mt :RunTests<CR>
