# dotfiles

Personal dotfiles for **macOS**, managed with [yadm](https://yadm.io).

Tracked config lives under **`~/.dotfiles/`** so `yadm clone` does not drop `Brewfile`, `README.md`, or other files in `$HOME`. Bootstrap symlinks shell/editor config into the usual paths.

## New machine

```sh
brew install yadm
yadm clone git@github.com:tnek/dotfiles.git
```

yadm checks out into `$HOME` (only `.gitignore`, `.dotfiles/`, and `.config/yadm/bootstrap`), then runs bootstrap:

- Symlinks `~/.zshrc`, `~/.vim/`, `~/.config/nvim/`, etc. from `~/.dotfiles/`
- Installs [Homebrew](https://brew.sh) if missing, then `brew bundle install --file=~/.dotfiles/Brewfile`
- Terminal.app profile from `~/.dotfiles/osx/atom-one-light.terminal`
- zprezto, vim-plug, blink.cmp build

Re-run bootstrap after Brewfile or symlink-list changes:

```sh
~/.config/yadm/bootstrap
```

Bootstrap exits with an error on non-macOS systems. yadm only auto-runs bootstrap on **`yadm clone`**, not `pull`.

## Day-to-day usage

```sh
yadm status
yadm diff
yadm add ~/.dotfiles/.zpreztorc
yadm commit -m "update shell config"
yadm push
```

Edit either the symlink (`~/.zshrc`) or the store (`~/.dotfiles/.zshrc`) — they are the same file.

To track a new dotfile: add it under `~/.dotfiles/`, un-ignore it in `~/.gitignore`, add its path to `DOTFILE_LINKS` in `.config/yadm/bootstrap` if it should appear in `$HOME`, then `yadm add` and commit.

Optional local overrides: `~/.zshrc.local` (sourced from `.zshrc`, not tracked).

## Layout

| Path | Purpose |
|------|---------|
| `~/.dotfiles/` | Versioned config store (see below) |
| `~/.config/yadm/bootstrap` | Post-clone macOS setup + symlinks |
| `~/.gitignore` | yadm worktree ignore rules |

| `~/.dotfiles/…` | Purpose |
|----------------|---------|
| `.zpreztorc` | Prezto / zsh options |
| `.zshrc` | Sources Prezto, then `.config/zsh/post.zsh` |
| `.config/zsh/paths.zsh` | Homebrew + keg PATH |
| `.config/zsh/post.zsh` | fzf keybindings |
| `.tmux.conf` | tmux |
| `.screenrc` | GNU screen |
| `.vim/` | Vim config (vim-plug, airline, vim-go) |
| `.config/nvim/` | Neovim (blink.cmp, lspconfig) |
| `Brewfile` | Homebrew dependencies (not symlinked to `$HOME`) |
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
brew bundle install --file=~/.dotfiles/Brewfile
brew bundle check --file=~/.dotfiles/Brewfile
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
