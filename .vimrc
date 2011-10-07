set t_Co=256
"set foldmethod=indent
set ignorecase
set hidden
set textwidth=0
set clipboard=unnamed

"set mouse=a
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>

" Disable Generation of Backup Files
" ----------------------------------
"  actually they are nice but vim is stable and doesn't crash :D
set nobackup
set noswapfile

let mapleader=","
let maplocalleader="<"

" User Interface
" --------------
" activate wildmenu, permanent ruler and disable Toolbar, and add line
" highlightng as well as numbers.
" And disable the sucking pydoc preview window for the omni completion
" also highlight current line and disable the blinking cursor.
set wildmenu
set ruler
set wrap
set guioptions-=T
"set cursorline
set completeopt-=preview
set gcr=a:blinkon0

" Set Better Indention
" --------------------
"  go with smartindent if there is no plugin indent file.
"  but don't outdent hashes
set smartindent
"inoremap # X#

" Statusbar and Linenumbers
" -------------------------
"  Make the command line two lines heigh and change the statusline display to
"  something that looks useful.
set cmdheight=1
set laststatus=2
set statusline=[%l,%c\ %P%M]\ [%{getcwd()}%*\][%{GitBranchInfoTokens()[0]}]\ %f\ %r%h%w
set number

" Tab Settings
" ------------
"set smarttab
"set tabstop=4

" utf-8 default encoding
" ----------------------
set enc=utf-8

"yaml
autocmd FileType yaml set ai sw=2 sts=2 et
autocmd FileType coffee set ai sw=2 sts=2 et

autocmd FileType objc setlocal shiftwidth=4 expandtab tabstop=4 softtabstop=4


" python support
" --------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes and it sucks ass if it's highlighted then. And for exceptions I
"  don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal shiftwidth=4 expandtab tabstop=4 softtabstop=4
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0


" template language support (SGML / XML too)
" ------------------------------------------

autocmd FileType html,xml,asp,aspx,master,ascx,ejs setlocal shiftwidth=4 tabstop=4 softtabstop=4 smartindent!
autocmd BufNewFile,BufRead *.html,*.htm,*.master,*.aspx,*.ascx,*.ejs setlocal ft=html
"autocmd BufNewFile,BufRead *.html,*.htm  call s:SelectHTML()
"let html_no_rendering=1

au BufRead,BufNewFile COMMIT_EDITMSG setlocal ft=git 

" CSS
" ---
autocmd FileType css setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType less setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufNewFile,BufRead *.less setlocal ft=less

" rst
" ---
autocmd BufNewFile,BufRead *.txt setlocal ft=rst
autocmd FileType rst setlocal shiftwidth=4 tabstop=4 softtabstop=4

autocmd FileType php set si ai sw=4 ts=4 sts=4 noexpandtab
autocmd BufRead *.php highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead *.php match BadWhitespace /\s\+$/

autocmd BufNewFile,BufRead *.applescript setlocal ft=applescript
autocmd FileType applescript set sw=4 ts=4 sts=4 noexpandtab

autocmd FileType markdown set sw=2 ts=2 sts=2
autocmd FileType vimwiki set sw=2 ts=2 sts=2
let g:vimwiki_listsyms = "    X"

" Javascript
" ----------
autocmd FileType javascript set ai sw=2 sts=2 et
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
let javascript_enable_domhtmlcss=1


" File Browser
" ------------
" hide some files and remove stupid help
let g:explHideFiles='^\.,.*\.sw[po]$,.*\.pyc$'
let g:explDetailedHelp=0
map  :Explore!<CR>

" Better Search
" -------------
set hlsearch
set incsearch
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

map ,v :e ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>
map ,g :MyGrep 


map <C-q> :BufClose<CR>
map ,q :bd<CR>
map ,d :BufCloseAll<CR>
map gs :%s:
map ss :s:
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
map ,fr :FufRenewCache<CR>
map ,rs :call ReloadSnippets(snippets_dir, &ft)<CR>
map ,rc :exec(":e ".snippets_dir.&ft.".snippets")<CR>
map ,o :!open .<CR>

nnoremap <silent> sd  :FufDir ~/.shortcuts/<CR>
nnoremap <silent> cd  :FufDirWithFullCwd<CR>
nnoremap <silent> cf  :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> cv  :FufTag<CR>
nnoremap <silent> <space>  :FufBuffer<CR>
nnoremap <silent> <tab>  :FufFile<CR>

nnoremap <silent> \ :FufCoverageFile<CR>

fu! FindeHowMain()
	call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', ['**/main.php']]) | FufCoverageFile
endfu
nnoremap <silent> <leader>fm :call FindeHowMain()<CR>
fu! FindeHowController()
	call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', ['**/controller.php']]) | FufCoverageFile
endfu
nnoremap <silent> <leader>fc :call FindeHowController()<CR>
fu! FindUI()
	call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', ['**/*.css','**/*.js']]) | FufCoverageFile
endfu
nnoremap <silent> <leader>fu :call FindUI()<CR>
fu! FindWiki()
	call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', ['~/Dropbox/Notes/**/*.wiki']]) | FufCoverageFile
endfu
nnoremap <silent> <leader>fw :call FindWiki()<CR>
fu! FindWikiIndex()
	call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', ['~/Dropbox/Notes/**/index.wiki']]) | FufCoverageFile
endfu
nnoremap <silent> <leader>fi :call FindWikiIndex()<CR>


let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.pyc$|\.jpg$|\.png$|\.gif$|media/.*|ui/compressed/'
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|jpg|png|gif|pyc|DS_Store|designer.cs)$|node_modules|vendor|dist|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

vmap <Tab> >gv
vmap <S-Tab> <gv

vmap <right> >gv
vmap <left> <gv

noremap <S-Up> <C-A>
noremap <S-Down> <C-X>

set cursorline

nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

set diffopt=filler
set diffopt+=iwhite
set tags=~/tags

set shell=/bin/bash

if !has('gui_running')
  set backspace=indent,eol,start
endif

let g:sparkupNextMapping = '<c-s>'

let g:git_branch_status_head_current=1 
let g:git_branch_status_nogit=""
let g:git_branch_status_text=" " 
let g:git_branch_status_ignore_remotes=1

fu! DoRunCode()  
  execute "w"
  pclose! " force preview window closed
  
  let ex = "python"
  if &ft == "coffee"
    let ex = "coffee"
  elseif &ft == "javascript"
    let ex = "node"
  elseif &ft == "applescript"
    let ex = "osascript"
  end

  let f = expand("%:p")

  let curfile = bufname("%")
  below new

  execute "%!".ex." ".curfile
  "call delete(tmpfile)

  setlocal previewwindow ro nomodifiable nomodified

  winc p
endfu
command! RunCode call DoRunCode()
map <Leader>e :RunCode<CR>

function! UpdateTags()
  let f = expand("%:p")
  let cmd = '/opt/local/bin/ctags -o ~/tags "'.f.'"'
  call system(cmd)
endfunction
autocmd BufEnter,BufRead,BufWritePost *.js,*.html,*.py,*.taskpaper call UpdateTags()

let g:vimwiki_list = [
    \ {'path': '~/Dropbox/Notes', 'index': 'index', 'ext': '.wiki', 'auto_export': 0 },
    \ {'path': '~/Dropbox/Notes/personal/', 'index': 'index', 'ext': '.wiki', 'auto_export': 0 },
    \ {'path': '~/Dropbox/Notes/projects/', 'index': 'index', 'ext': '.wiki', 'auto_export': 0 },
    \ {'path': '~/Dropbox/Notes/demandmedia/', 'index': 'index', 'ext': '.wiki', 'auto_export': 0 }
    \ ]
let g:vimwiki_camel_case=0
"let g:vimwiki_folding=1
"let g:vimwiki_fold_lists=1
let g:vimwiki_hl_cb_checked=1
call pathogen#infect()
syntax on
filetype plugin indent on

if has("gui_running")
  set guifont=Monaco:h12
endif
set background=dark
colorscheme lucius
"autocmd BufEnter,BufRead *.* DetectIndent

let g:vimwiki_tasks_dir = "~/Dropbox/Notes/**/*.wiki" 
let g:vimwiki_tasks_dir_sorted = "~/Dropbox/Notes/" 
