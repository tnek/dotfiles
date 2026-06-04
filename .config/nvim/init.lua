-- Neovim entrypoint: shared Vim config + Neovim-only settings

local vim_runtime = vim.fn.expand("~/.vim")
vim.opt.runtimepath:prepend(vim_runtime)
vim.opt.packpath = vim.opt.runtimepath:get()

vim.cmd("source ~/.vim/vimrc")

vim.opt.termguicolors = true
vim.opt.updatetime = 250

require("blink")
require("lsp")
