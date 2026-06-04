# Homebrew and keg-only paths (zsh only — bootstrap sets PATH in bash separately)

[[ -n "${ZSH_VERSION:-}" ]] || return 0

typeset -ga path
(( ${#path[@]} )) || path=("${(s.:.)PATH}")

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

_prepend_path() {
  [[ -d "$1" ]] && path=("$1" ${path[@]})
}

_prepend_path /opt/homebrew/opt/llvm/bin
_prepend_path /usr/local/opt/llvm/bin
_prepend_path /opt/homebrew/opt/fzf/bin
_prepend_path /usr/local/opt/fzf/bin
_prepend_path "$HOME/go/bin"
