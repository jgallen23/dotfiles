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
"Bundle "daylerees/colour-schemes", { "rtp": "vim/" }
Bundle 'chriskempson/base16-vim'
"Bundle 'w0ng/vim-hybrid'

Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'SirVer/ultisnips'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'gregsexton/MatchTag'
Bundle 'edsono/vim-matchit'
Bundle 'ervandew/supertab'
Bundle 'jgallen23/grep.vim'
Bundle 'jgallen23/runcode.vim'
"Bundle 'jgallen23/vim-bufsurf'
Bundle 'duff/vim-bufonly'
Bundle 'jgallen23/Color-Scheme-Test'
Bundle 'itspriddle/vim-marked'
"Bundle 'jgallen23/marktodo.vim'
"Bundle 'tpope/vim-vinegar'
Bundle 'jgallen23/openurl.vim'
Bundle 'vim-scripts/Decho'
"Bundle 't9md/vim-smalls'
Bundle 'majutsushi/tagbar'
Bundle 'zhaocai/DirDiff.vim'
Bundle 'idanarye/vim-merginal'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'Keithbsmiley/gist.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'eiginn/netrw'
Bundle 'd11wtq/ctrlp_bdelete.vim'
Bundle 'haya14busa/incsearch.vim'
Bundle 'jeetsukumaran/vim-filebeagle'
Plugin 'octref/RootIgnore'

filetype plugin indent on     " required!
