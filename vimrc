" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" Appearance stuff {{{
set background=dark
colorscheme slate
set gfn=terminus
" }}}
" General Settings {{{
syntax on
"filetype plugin indent on
set encoding=utf-8
" }}}
" Other settings {{{
set modeline
set modelines=5

" improves redrawing for newer computers {{{
set nolazyredraw        " turn off lazy redraw
set nohlsearch          " highlight no search results
set spelllang=pl,en     " set spelling lang
" }}}

" Searching and history {{{
set incsearch         " increment search
set ignorecase        " case-insensitive search;
set nobackup          " don't create backup files
set noswapfile        " don't create swap file
set history=50        " keep 50 lines of command line history
" }}}
