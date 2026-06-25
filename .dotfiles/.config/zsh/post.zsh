# Sourced from ~/.zshrc after Prezto (macOS only)

[[ -s "${ZDOTDIR:-$HOME}/.config/zsh/paths.zsh" ]] && source "${ZDOTDIR:-$HOME}/.config/zsh/paths.zsh"

if ! command -v fzf &>/dev/null; then
  return
fi

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
if command -v fd &>/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND:-}"

[[ -o interactive && -t 0 && -t 1 ]] || return 0

source <(fzf --zsh)
bindkey '^T' fzf-file-widget
bindkey '^R' fzf-history-widget
bindkey '\ec' fzf-cd-widget
