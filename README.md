# dotfiles

Personal dotfiles managed with [yadm](https://yadm.io).

## New machine

Install yadm, then clone:

```sh
brew install yadm   # macOS
yadm clone https://github.com/tnek/dotfiles.git
```

yadm checks out tracked files into `$HOME` and runs `.config/yadm/bootstrap` (Homebrew, zprezto, vim-plug).

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
| `.vim/` | Vim config (plugins via vim-plug in bootstrap) |
| `.config/nvim/init.vim` | Neovim (sources `~/.vim/vimrc`) |
| `.config/yadm/bootstrap` | Post-clone setup |
| `osx/atom-one-light.terminal` | Terminal.app color profile (import manually) |
| `README.md` | This file |

Shell login files (`.zprofile`, `.zshrc`) come from [zprezto](https://github.com/sorin-ionescu/prezto), installed by bootstrap.

## Installing yadm

| Platform | Command |
|----------|---------|
| macOS | `brew install yadm` |
| Arch Linux | `sudo pacman -S yadm` |
| Debian/Ubuntu | `sudo apt install yadm` |
