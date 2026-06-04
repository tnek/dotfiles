#
# Zsh startup (yadm, macOS) — sources Prezto, then ~/.config/zsh/post.zsh
#

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.config/zsh/post.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.config/zsh/post.zsh"
fi

# Local overrides (not tracked)
[[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]] && source "${ZDOTDIR:-$HOME}/.zshrc.local"
