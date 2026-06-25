#
# Zsh startup (yadm, macOS) — sources Prezto, then ~/.config/zsh/post.zsh
#

# Avoid zsh trying to nice background startup jobs in restricted shells.
setopt no_bg_nice

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.config/zsh/post.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.config/zsh/post.zsh"
fi

# Local overrides (not tracked)
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi
