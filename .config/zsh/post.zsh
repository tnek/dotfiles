# Sourced from ~/.zshrc after Prezto (macOS only)
# Homebrew packages (fzf, fd, …) come from ~/Brewfile via yadm bootstrap.

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

[[ -d /opt/homebrew/opt/fzf/bin ]] && path=(/opt/homebrew/opt/fzf/bin $path)
[[ -d /usr/local/opt/fzf/bin ]] && path=(/usr/local/opt/fzf/bin $path)

if ! command -v fzf &>/dev/null; then
  return
fi

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
if command -v fd &>/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND:-}"

source <(fzf --zsh)
bindkey '^T' fzf-file-widget
bindkey '^R' fzf-history-widget
bindkey '\ec' fzf-cd-widget
