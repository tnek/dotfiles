# Sourced from ~/.zshrc after Prezto (see dotfiles .zshrc)

#
# FZF
#

if [[ "$OSTYPE" == darwin* ]]; then
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  if ! command -v fzf &>/dev/null && command -v brew &>/dev/null; then
    brew list fzf &>/dev/null 2>&1 || brew install fzf
    brew list fd &>/dev/null 2>&1 || brew install fd
  fi
  [[ -d /opt/homebrew/opt/fzf/bin ]] && path=(/opt/homebrew/opt/fzf/bin $path)
  [[ -d /usr/local/opt/fzf/bin ]] && path=(/usr/local/opt/fzf/bin $path)
fi

if ! command -v fzf &>/dev/null; then
  return
fi

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
if command -v fd &>/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
elif command -v fd-find &>/dev/null; then
  export FZF_DEFAULT_COMMAND='fd-find --type f --hidden --follow --exclude .git'
fi
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND:-}"
if command -v fd &>/dev/null; then
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
elif command -v fd-find &>/dev/null; then
  export FZF_ALT_C_COMMAND='fd-find --type d --hidden --follow --exclude .git'
fi

source <(fzf --zsh)
bindkey '^T' fzf-file-widget
bindkey '^R' fzf-history-widget
bindkey '\ec' fzf-cd-widget
