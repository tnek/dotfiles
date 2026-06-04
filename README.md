# dotfiles

Personal dotfiles managed with [yadm](https://yadm.io).

## New machine

Install yadm, then clone:

```sh
brew install yadm   # macOS
yadm clone https://github.com/tnek/dotfiles.git
```

yadm checks out tracked files into `$HOME` and runs `.config/yadm/bootstrap`:

- **LSP servers:** `clangd`, `gopls`, `pyright` (plus `neovim`)
- **Shell:** zprezto, fzf + fd (`source <(fzf --zsh)`; installed by bootstrap)
- **Editor:** vim-plug plugins, blink.cmp build

## Day-to-day usage

yadm wraps git:

```sh
yadm status
yadm diff
yadm add ~/.zpreztorc
yadm commit -m "update shell config"
yadm push
```

To track a new dotfile, add it to `.gitignore` (un-ignore the path), then `yadm add` and commit.

## Files tracked

| Path | Purpose |
|------|---------|
| `.zpreztorc` | Prezto / zsh options |
| `.tmux.conf` | tmux |
| `.screenrc` | GNU screen |
| `.vim/` | Shared Vim config (vim-plug, airline, codefmt) |
| `.config/nvim/` | Neovim (`init.lua`, blink.cmp, lspconfig) |
| `.config/yadm/bootstrap` | Post-clone setup |
| `osx/atom-one-light.terminal` | Terminal.app color profile (import manually) |
| `README.md` | This file |

Shell login files (`.zprofile`, `.zshrc`) come from [zprezto](https://github.com/sorin-ionescu/prezto), installed by bootstrap.

### Neovim LSP + completion

**Language servers** (installed by bootstrap):

| Server | Languages | macOS (Homebrew) |
|--------|-----------|------------------|
| `clangd` | C, C++ | `llvm` |
| `gopls` | Go | `gopls`, `go` |
| `pyright` | Python | `pyright` |

**Completion:** [blink.cmp](https://github.com/Saghen/blink.cmp) (v1) with LSP, path, snippets, and buffer sources.

**LSP navigation**

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `[d` / `]d` | Prev / next diagnostic |

**blink completion** (preset `default`; see `:help blink-cmp`)

| Key | Action |
|-----|--------|
| `<C-Space>` | Open completion menu |
| `<C-y>` | Accept |
| `<C-n>` / `<C-p>` | Next / prev item |
| `<C-e>` | Close menu |

Format-on-save tools (`yapf`, `clang-format`, etc.) are used by vim-codefmt when installed separately.

## Installing yadm

| Platform | Command |
|----------|---------|
| macOS | `brew install yadm` |
| Arch Linux | `sudo pacman -S yadm` |
| Debian/Ubuntu | `sudo apt install yadm` |
