set shell=/bin/bash
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jgallen23/The-NERD-Commenter'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'jgallen23/vim-stylus'
Bundle 'gregsexton/MatchTag'
Bundle 'edsono/vim-matchit'
Bundle 'chriskempson/base16-vim'
Bundle 'spolu/dwm.vim'
Bundle 'vim-scripts/ZoomWin'

filetype plugin indent on     " required!
