" LaTeX (rubber) macro for compiling
map <buffer> <C-b> :w<CR>:!xelatex %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>
