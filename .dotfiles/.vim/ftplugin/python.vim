" Run current buffer with python3
nnoremap <buffer> <leader>r :w<CR>:!./usr/bin/env python3 %<CR>
" Toggle line comments
nnoremap <buffer> <leader>c :s/^/#/<CR>
nnoremap <buffer> <leader>u :s/^#//<CR>
