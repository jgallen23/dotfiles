set shell=/bin/bash
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
"Bundle 'msanders/snipmate.vim'
Bundle 'SirVer/ultisnips'
Bundle 'pangloss/vim-javascript'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'jgallen23/vim-stylus'
Bundle 'gregsexton/MatchTag'
Bundle 'edsono/vim-matchit'
Bundle 'chriskempson/base16-vim'
"Bundle 'spolu/dwm.vim'
Bundle 'ervandew/supertab'
Bundle 'jgallen23/grep.vim'
Bundle 'jgallen23/runcode.vim'
Bundle 'jgallen23/vim-bufsurf'
Bundle 'groenewege/vim-less'
"Bundle 'mattn/zencoding-vim'
Bundle 'goldfeld/vim-seek'
Bundle 'pzich/phtmlSwitch-vim'
Bundle 'duff/vim-bufonly'
Bundle 'digitaltoad/vim-jade'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'jgallen23/Color-Scheme-Test'
Bundle 'mikewest/vimroom'

filetype plugin indent on     " required!
