# dotfiles

Personal dotfiles for **macOS**, managed with [yadm](https://yadm.io).

## New machine

```sh
brew install yadm
yadm clone git@github.com:tnek/dotfiles.git
```

yadm checks out tracked files into `$HOME` and runs `.config/yadm/bootstrap`:

- Installs [Homebrew](https://brew.sh) if missing, then `brew bundle install --file=~/Brewfile`
- Terminal.app profile from `osx/atom-one-light.terminal`
- zprezto, vim-plug, blink.cmp build

Re-run bootstrap after Brewfile changes:

```sh
~/.config/yadm/bootstrap
```

Bootstrap exits with an error on non-macOS systems. yadm only auto-runs bootstrap on **`yadm clone`**, not `pull`.

## Day-to-day usage

```sh
yadm status
yadm diff
yadm add ~/.zpreztorc
yadm commit -m "update shell config"
yadm push
```

To track a new dotfile, add it to `.gitignore` (un-ignore the path), then `yadm add` and commit.

Optional local overrides: `~/.zshrc.local` (sourced from `.zshrc`, not tracked).

## Files tracked

| Path | Purpose |
|------|---------|
| `.zpreztorc` | Prezto / zsh options |
| `.zshrc` | Sources Prezto, then `.config/zsh/post.zsh` |
| `.config/zsh/paths.zsh` | Homebrew + keg PATH |
| `.config/zsh/post.zsh` | fzf keybindings |
| `.tmux.conf` | tmux |
| `.screenrc` | GNU screen |
| `.vim/` | Vim config (vim-plug, airline, vim-go) |
| `.config/nvim/` | Neovim (blink.cmp, lspconfig) |
| `.config/yadm/bootstrap` | Post-clone macOS setup |
| `Brewfile` | Homebrew dependencies |
| `osx/atom-one-light.terminal` | Terminal.app theme |
| `README.md` | This file |

- **`.zprofile`** is a prezto symlink (not tracked); **`.zshrc`** is managed here.
- Remove redundant `~/dotfiles` clone if present — use yadm only.

## Brewfile

| Package | Purpose |
|---------|---------|
| `yadm`, `tmux` | Dotfiles + multiplexer |
| `fzf`, `fd` | Shell fuzzy find |
| `neovim`, `pyright`, `llvm`, `go`, `gopls`, `goimports`, `lua-language-server` | Editor + LSP |

```sh
brew bundle install --file=~/Brewfile
brew bundle check --file=~/Brewfile
```

## Neovim

**LSP:** `lua_ls`, `pyright`, `clangd`, `gopls` — **completion:** blink.cmp (v1)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>f` | Format buffer |
| `[d` / `]d` | Prev / next diagnostic |
| `<C-Space>` | Open completion (blink) |
| `<C-y>` | Accept completion |

**Format on save:** Go via vim-go (`goimports`); other LSP filetypes via `vim.lsp.buf.format`.

## tmux

Prefix is **Ctrl-a** (same as readline beginning-of-line — intentional). Mouse and focus-events enabled.

## Installing yadm

```sh
brew install yadm
```
