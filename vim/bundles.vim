set shell=/bin/bash
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'itchyny/lightline.vim'

"colorschemes
Plugin 'chriskempson/base16-vim'
"Plugin 'baskerville/bubblegum'
"Plugin 'jonathanfilip/vim-lucius'
"Plugin '29decibel/codeschool-vim-theme'
"Plugin 'w0ng/vim-hybrid'
"Plugin 'jacoborus/tender'

Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'SirVer/ultisnips'
Plugin 'ap/vim-buftabline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'duff/vim-bufonly'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'eiginn/netrw'
Plugin 'ervandew/supertab'
Plugin 'felixjung/vim-base16-lightline'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'gregsexton/MatchTag'
Plugin 'haya14busa/incsearch.vim'
Plugin 'int3/vim-extradite'
Plugin 'itspriddle/vim-marked'
Plugin 'jgallen23/Color-Scheme-Test'
Plugin 'jgallen23/grep.vim'
Plugin 'jgallen23/openurl.vim'
Plugin 'jgallen23/runcode.vim'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'pzich/phtmlSwitch-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'stephenway/postcss.vim'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/Decho'
Plugin 'will133/vim-dirdiff'
Plugin 'jgallen23/vim-bufsurf'
Plugin 'othree/yajs.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch-easymotion.vim'

call vundle#end()
filetype plugin indent on     " required!
