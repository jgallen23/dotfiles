set background=dark
if hostname() == "localhost"
  colorscheme ir_black
else
  colorscheme base16-tomorrow
endif

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
set guioptions-=r
set guioptions-=L

set smartindent
set cmdheight=1
set laststatus=2
set statusline=[%l,%c\ %P%M]\ [%{getcwd()}%*\]%{fugitive#statusline()}\ %f\ %r%h%w
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set nohlsearch
nnoremap <leader>hl :set hlsearch!<CR>
set incsearch
set cursorline
set relativenumber
set mouse=a
set list listchars=tab:→\ ,trail:·
"center screen
set so=999

set tabstop=2
set shiftwidth=2
set expandtab

map <leader>v :e ~/.vimrc<CR><C-W>_
map <leader>b :Explore<CR>
map <leader>e :RunCode<CR>

"move around windows better
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-c> :wincmd c<CR>
nmap <silent> <C-y> :wincmd v<CR>
nmap <silent> <C-n> :wincmd s<CR>

"indent
vmap <Tab> >gv
vmap <S-Tab> <gv
vmap <right> >gv
vmap <left> <gv

"start end of line
noremap H ^ 
noremap L g_

"javascript
au! BufRead,BufNewFile *.json setfiletype javascript

au! BufRead,BufNewFile *.handlebars setfiletype html
au BufNewFile,BufRead *.ejs set filetype=html

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

"buffer delete
map <leader>q :bd<CR>

"map W to save
command! W w
command! Wqa wqa

let g:netrw_home=$HOME

map <leader>o :set cursorcolumn!<CR>

set previewheight=25

autocmd VimEnter * NERDTree | wincmd p
