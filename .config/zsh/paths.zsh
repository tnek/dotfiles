# Homebrew and keg-only paths (macOS)

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

[[ -d /opt/homebrew/opt/llvm/bin ]] && path=(/opt/homebrew/opt/llvm/bin $path)
[[ -d /usr/local/opt/llvm/bin ]] && path=(/usr/local/opt/llvm/bin $path)
[[ -d /opt/homebrew/opt/fzf/bin ]] && path=(/opt/homebrew/opt/fzf/bin $path)
[[ -d /usr/local/opt/fzf/bin ]] && path=(/usr/local/opt/fzf/bin $path)
[[ -d "$HOME/go/bin" ]] && path=($HOME/go/bin $path)
