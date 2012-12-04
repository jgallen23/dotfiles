source ~/.vim/bundles.vim

syntax on
filetype plugin indent on

set background=dark
"set t_Co=256
"let base16colorspace=256
colorscheme base16-default

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
set statusline=[%l,%c\ %P%M]\ [%{getcwd()}%*\]%{fugitive#statusline()}\ %f\ %r%h%w
set nohlsearch
nnoremap <leader>hl :set hlsearch!<CR>
set incsearch
set cursorline
set relativenumber
set mouse=a
set list listchars=tab:→\ ,trail:·

set tabstop=2
set shiftwidth=2
set expandtab

map <leader>v :e ~/.vimrc<CR><C-W>_
map <leader>b :Explore<CR>
map <leader>gr :MyGrep 
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

"go to previous file
nmap <BS> :e #<CR>
nmap <leader><leader> :e #<CR>

"javascript
au! BufRead,BufNewFile *.json setfiletype javascript
autocmd FileType javascript set et
"php
autocmd FileType php set noexpandtab

au! BufRead,BufNewFile *.handlebars setfiletype html

"change cwd
command! CWD :cd %:p:h

"fix backspace
if !has('gui_running')
	set backspace=indent,eol,start
endif

"Redraw
map <leader>a :redraw!<CR>

"paste
nmap <leader>p :set paste!<BAR>:set paste?<CR>

source ~/.vim/config/snippets.vim
source ~/.vim/config/nerdtree.vim
source ~/.vim/config/ctrlp.vim
source ~/.vim/config/syntastic.vim
source ~/.vim/config/easymotion.vim
source ~/.vim/config/fugitive.vim
source ~/.vim/config/markdown.vim
source ~/.vim/config/tabs.vim
source ~/.vim/config/dwm.vim
source ~/.vim/config/projects.vim
source ~/.vim/config/wrap.vim

