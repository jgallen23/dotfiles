set t_Co=256
"set foldmethod=indent
set ignorecase
set hidden

set clipboard=unnamed

"set mouse=a
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>

" Disable Generation of Backup Files
" ----------------------------------
"  actually they are nice but vim is stable and doesn't crash :D
set nobackup
set noswapfile

" Leader
" ------
" sets leader to ',' and localleader to "\"
let mapleader=","
let maplocalleader=","

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
inoremap # X#

" Statusbar and Linenumbers
" -------------------------
"  Make the command line two lines heigh and change the statusline display to
"  something that looks useful.
set cmdheight=1
set laststatus=2
set statusline=[%l,%c\ %P%M]\ [%{getcwd()}%*\][%{GitBranch()}]%{AutoRefreshStatusLine()}\ %f\ %r%h%w
set number

" Tab Settings
" ------------
set smarttab
set tabstop=4

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
let html_no_rendering=1

let g:closetag_default_xml=1
autocmd FileType html let b:closetag_html_style=1
autocmd FileType html,xml source ~/.vim/scripts/closetag.vim

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

" PHP
" ---------
"syn region htmlphpBlock start='<?' end='?>' keepend
"hi link htmlphpBlock comment
autocmd FileType php set si ai sw=4 ts=4 sts=4
autocmd BufRead *.php highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead *.php match BadWhitespace /\s\+$/


" Javascript
" ----------
autocmd FileType javascript set ai sw=2 sts=2 et
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
let javascript_enable_domhtmlcss=1

" If there isn't one, append a semi colon to the end of the current line.
function! s:appendSemiColon()
    if getline('.') !~ ';$'
        let original_cursor_position = getpos('.')
        exec("s/$/;/")
        call setpos('.', original_cursor_position)
    endif
endfunction

" For programming languages using a semi colon at the end of statement.
autocmd FileType javascript nmap <silent> <Leader>; :call <SID>appendSemiColon()<cr>
 

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



" Minibuffer
" ----------
"  one click is enough and fix some funny bugs
let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplSplitBelow=1

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)

map ,v :e ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>
"map ,p :!python %<CR>
map ,g :MyGrep 

if glob("/opt/local/bin/ctags") != ""
    let g:tagbar_ctags_bin="/opt/local/bin/ctags"
else
    let g:tagbar_ctags_bin="/usr/bin/ctags"
endif

"let g:ctags_statusline=1

set textwidth=0

let g:NERDTreeShowBookmarks=1
let g:NERDChristmasTree=0
let g:NERDTreeChDirMode=2
"let g:FuzzyFinderOptions.File.excluded_path = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.pyc$'
map <C-q> :BufClose<CR>
map ,q :bd<CR>
map ,d :BufCloseAll<CR>
map ,f :colorscheme default<CR>
map gs :%s:
map ss :s:
"map ,t :TlistToggle<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
map ,fr :FufRenewCache<CR>
map ,rs :call ReloadSnippets(snippets_dir, &ft)<CR>
map ,rc :exec(":e ".snippets_dir.&ft.".snippets")<CR>
map ,o :!open .<CR>

nnoremap <silent> sd	:FufDir ~/.shortcuts/<CR>
nnoremap <silent> dm	:FufDir ~/.shortcuts/dm/<CR>
nnoremap <silent> cd	:FufDirWithFullCwd<CR>
nnoremap <silent> cf	:FufFileWithCurrentBufferDir<CR>
nnoremap <silent> cv	:FufTag<CR>
nnoremap <silent> <space>	:FufBuffer<CR>
"nnoremap <silent> <tab> :FufFile **/<CR>
nnoremap <silent> <tab>	:FufFile<CR>

"if !has("gui_macvim")
nnoremap <silent> \ :FufCoverageFile<CR>
"endif
nnoremap <silent> fh	:call fuf#givenfile#launch('', 0, 'html>', split(glob('**/*.html'), "\n"))<CR>
nnoremap <silent> fp	:call fuf#givenfile#launch('', 0, 'python>', split(glob('**/*.py'), "\n"))<CR>
nnoremap <silent> fj	:call fuf#givenfile#launch('', 0, 'javascript>', split(glob('**/*.js'), "\n"))<CR>
nnoremap <silent> fc	:call fuf#givenfile#launch('', 0, 'css>', split(glob('**/*.css'), "\n"))<CR>

let NERDTreeIgnore=['\.pyc$', '\~$']
let g:autotagVerbosityLevel=0
let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.pyc$|\.jpg$|\.png$|\.gif$|media/.*|ui/compressed/'
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|jpg|png|gif|pyc|DS_Store|designer.cs)$|node_modules|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

vmap <Tab> >gv
vmap <S-Tab> <gv

noremap <S-Up> <C-A>
noremap <S-Down> <C-X>

"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorline
"nnoremap <Leader>c :set cursorline!<CR>

nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

set diffopt=filler
set diffopt+=iwhite
set tags=~/tags


set shell=/bin/bash

if !has('gui_running')
	set backspace=indent,eol,start
endif

"if has("gui_running") && system('ps xw | grep "Vim -psn" | grep -vc grep') > 0
  "" Get the value of $PATH from a login shell.
  "" If your shell is not on this list, it may be just because we have not
  "" tested it.  Try adding it to the list and see if it works.  If so,
  "" please post a note to the vim-mac list!
  "if $SHELL =~ '/\(sh\|csh\|bash\|tcsh\|zsh\|fish\)$'
    "let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
    "let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
  "endif
"endif

let g:sparkupNextMapping = '<c-s>'

let g:git_branch_status_head_current=1 
let g:git_branch_status_nogit=""
let g:git_branch_status_text=" " 
let g:git_branch_status_ignore_remotes=1

fu! DoRunPyBuffer2()
	pclose! " force preview window closed
	setlocal ft=python

	" copy the buffer into a new window, then run that buffer through python
	sil %y a | below new | sil put a | sil %!python -
	" indicate the output window as the current previewwindow
	setlocal previewwindow ro nomodifiable nomodified

	" back into the original window
	winc p
endfu
command! RunPyBuffer call DoRunPyBuffer2()


fu! DoRunNodeBuffer2()
	pclose! " force preview window closed
	setlocal ft=javascript

	" copy the buffer into a new window, then run that buffer through python
	let curfile = bufname("%")
	let tmpfile = tempname()
	silent execute "write! ".tmpfile
	below new
	execute "%!node ".tmpfile
	call delete(tmpfile)

	" indicate the output window as the current previewwindow
	setlocal previewwindow ro nomodifiable nomodified

	" back into the original window
	winc p
endfu
command! RunNodeBuffer call DoRunNodeBuffer2()
map <Leader>n :RunNodeBuffer<CR>

fu! DoRunCoffeeBuffer2()
	pclose! " force preview window closed
	setlocal ft=coffee

	let curfile = bufname("%")
	let tmpfile = tempname()
	silent execute "write! ".tmpfile
	below new
	execute "%!coffee ".tmpfile
	call delete(tmpfile)

	" indicate the output window as the current previewwindow
	setlocal previewwindow ro nomodifiable nomodified

	" back into the original window
	winc p
endfu
command! RunCoffeeBuffer call DoRunCoffeeBuffer2()
map <Leader>c :RunCoffeeBuffer<CR>


fu! DoRunCode()	
  execute "w"
  pclose! " force preview window closed
	
  let ex = "python"
  if &ft == "coffee"
    let ex = "coffee"
  elseif &ft == "javascript"
    let ex = "node"
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


map <Leader>tk :e ~/Dropbox/Tasks/Personal.taskpaper<CR>
map <Leader>dm :e ~/Dropbox/Tasks/DemandMedia.taskpaper<CR>

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  "map \ <Plug>PeepOpen
end

function! UpdateTags()
	let f = expand("%:p")
	let cmd = '/opt/local/bin/ctags -o ~/tags "'.f.'"'
	call system(cmd)
endfunction
autocmd BufEnter,BufRead,BufWritePost *.js,*.html,*.py,*.taskpaper call UpdateTags()

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype off
syntax on
filetype plugin indent on

if has("gui_running")
  set guifont=Monaco:h12
endif
set background=dark
colorscheme lucius

"call togglebg#map(",bg")

let g:tagbar_type_javascript = {
      \ 'ctagstype' : 'js',
      \ 'kinds'     : [
          \ 'o:object',
          \ 'f:function'
      \ ],
      \ 'sort'    : 0
  \ }
