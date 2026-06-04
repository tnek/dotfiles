# dotfiles

Personal dotfiles for **macOS**, managed with [yadm](https://yadm.io).

## New machine

```sh
brew install yadm
yadm clone git@github.com:tnek/dotfiles.git
```

yadm checks out tracked files into `$HOME` and runs `.config/yadm/bootstrap`:

- Installs [Homebrew](https://brew.sh) if missing, then `brew bundle install --file=~/Brewfile` (all CLI deps)
- Terminal.app profile from `osx/atom-one-light.terminal` (import + set as default)
- zprezto, vim-plug, blink.cmp build (not in Brewfile)

Bootstrap exits with an error on non-macOS systems.

## Day-to-day usage

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
| `.zshrc` | Sources Prezto, then `.config/zsh/post.zsh` |
| `.config/zsh/post.zsh` | fzf keybindings (after Prezto) |
| `.tmux.conf` | tmux |
| `.screenrc` | GNU screen |
| `.vim/` | Shared Vim config (vim-plug, airline, vim-go, codefmt) |
| `.config/nvim/` | Neovim (`init.lua`, blink.cmp, lspconfig) |
| `.config/yadm/bootstrap` | Post-clone macOS setup |
| `Brewfile` | Homebrew dependencies |
| `osx/atom-one-light.terminal` | Terminal.app theme (installed by bootstrap) |
| `README.md` | This file |

Shell login files (`.zprofile`, `.zshrc`) use [zprezto](https://github.com/sorin-ionescu/prezto), installed by bootstrap.

### Neovim LSP + completion

**Language servers** (from `Brewfile`):

| Server | Languages | Homebrew |
|--------|-----------|----------|
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

Format-on-save uses **vim-go** for Go (`goimports`) and vim-codefmt for other file types (see `Brewfile`):

| Tool | File types | Homebrew |
|------|------------|----------|
| `goimports` (vim-go) | Go | `goimports` |
| `yapf` | Python | `yapf` |
| `clang-format` | C, C++, etc. | `llvm` |
| `rustfmt` | Rust | `rust` |
| `prettier` | Vue | `prettier` |
| `buildifier` | Bazel | `buildifier` |
| `google-java-format` | Java | `google-java-format` |
| `js-beautify` | HTML, CSS, JSON, … | `js-beautify` |

Add a formula to `Brewfile`, then:

```sh
brew bundle install --file=~/Brewfile
```

## Installing yadm

```sh
brew install yadm
```
