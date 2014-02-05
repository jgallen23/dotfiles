set shell=/bin/bash
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'

"colorschemes
"Bundle 'baskerville/bubblegum'
"Bundle 'jonathanfilip/vim-lucius'
"Bundle '29decibel/codeschool-vim-theme'
Bundle 'w0ng/vim-hybrid'

Bundle 'scrooloose/nerdcommenter'
"Bundle 'tpope/vim-markdown'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'SirVer/ultisnips'
Bundle 'jgallen23/vim-javascript'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'hail2u/vim-css3-syntax'
"Bundle 'jgallen23/vim-stylus'
Bundle 'gregsexton/MatchTag'
Bundle 'edsono/vim-matchit'
Bundle 'chriskempson/base16-vim'
Bundle 'ervandew/supertab'
Bundle 'jgallen23/grep.vim'
Bundle 'jgallen23/runcode.vim'
Bundle 'jgallen23/vim-bufsurf'
Bundle 'groenewege/vim-less'
"Bundle 'pzich/phtmlSwitch-vim'
Bundle 'duff/vim-bufonly'
"Bundle 'digitaltoad/vim-jade'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'scrooloose/nerdtree'
Bundle 'jgallen23/Color-Scheme-Test'
"Bundle 'mikewest/vimroom'
"Bundle 'int3/vim-extradite'
Bundle 'itspriddle/vim-marked'
Bundle 'jgallen23/marktodo.vim'
Bundle 'vim-scripts/visSum.vim'
Bundle 'dhruvasagar/vim-table-mode'
Bundle 'tpope/vim-vinegar'
Bundle 'jgallen23/openurl.vim'

filetype plugin indent on     " required!
