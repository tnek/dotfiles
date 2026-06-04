# dotfiles

macOS · [yadm](https://yadm.io)

## Setup

```sh
brew install yadm
yadm clone git@github.com:tnek/dotfiles.git
```

Clone runs bootstrap (Homebrew packages, shell/editor symlinks, Terminal theme, vim/nvim plugins). Open a new terminal when it finishes.

Re-run bootstrap after changing the Brewfile:

```sh
~/.config/yadm/bootstrap
```
