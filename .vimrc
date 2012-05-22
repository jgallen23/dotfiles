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

"remotepb
let g:remotepb_server = "gregamel@imac"
