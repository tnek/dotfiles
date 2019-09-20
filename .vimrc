syntax on
syntax enable
filetype plugin indent on

let g:solarized_termcolors=256
set background=light
colorscheme solarized
hi Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'vim-airline/vim-airline'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'leafgarland/typescript-vim'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
call vundle#end()

let g:airline_theme='solarized'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

set encoding=utf-8
set nocompatible               " Use Vim defaults
set hidden                     " Quick buffer switching
set ruler                      " Show cursor position
set laststatus=2               " Show statusline even when no window split
set number                     " Line numbers
set cursorline
set scrolloff=2                " Keep 2 scroll lines above/below cursor
set fillchars=vert:\           " Remove ugly | in seperators
set noerrorbells               " Disable annoying beeps
"set visualbell
set expandtab                  " Tab -> Space
set tabstop=4                  " Tabs count for 4 columns
set softtabstop=4              " Tab == 4 spaces
set shiftwidth=4               " 4 Columns with reindent options
set autoindent                 " Ignore case
"set smartindent                " Except with capitals
set nohlsearch
set incsearch                  " Increment search
set ignorecase                 " Case-insensitive search;
set smartcase                  " Search becomes case sensitive if caps used
set nobackup
set noswapfile
set history=50
set shortmess+=I               " No startup message
set nolazyredraw
set mouse=a
set clipboard=unnamed

autocmd BufNewFile,BufRead * let b:ale_linters = []
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'c': ['clang-format'],
\    'cpp': ['clang-format'],
\    'python': ['black'],
\    'go': ['gofmt']
\}

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap <silent> <2-LeftMouse> :TagbarToggle<CR>
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_indent = 1
