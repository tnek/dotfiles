" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" Appearance stuff {{{
<<<<<<< HEAD
colorscheme jellybeans
set gfn=ubuntumono
" }}}

" General Settings {{{
syntax on
filetype plugin indent on
set encoding=utf-8
" }}}
" Other settings {{{
set number
set modeline
set modelines=5
set shortmess+=I

" Tabs {{{
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
" }}}
=======
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
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d

" improves redrawing for newer computers {{{
set nolazyredraw        " turn off lazy redraw
set nohlsearch          " highlight no search results
<<<<<<< HEAD
set spelllang=en     " set spelling lang
=======
set spelllang=pl,en     " set spelling lang
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d
" }}}

" Searching and history {{{
set incsearch         " increment search
set ignorecase        " case-insensitive search;
set nobackup          " don't create backup files
set noswapfile        " don't create swap file
set history=50        " keep 50 lines of command line history
" }}}
<<<<<<< HEAD

" Gvim stuff {{{
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
=======
>>>>>>> 5a13e3befd0e109c1b69441ddf748712b976091d
