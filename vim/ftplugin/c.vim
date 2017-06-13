map <buffer> <C-b> :w<CR>:!/usr/bin/g++ -Wall -std=c++14 *.cpp && ./a.out <CR>
noremap + :s/^/\/\//<CR>
noremap - :s/^\/\///<CR>
