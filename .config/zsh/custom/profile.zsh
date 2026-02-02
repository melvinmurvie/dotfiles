# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Vi mode
#   Installed with plugins defined in `.zshrc`.
VI_MODE_SET_CURSOR=true
# VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# Golang
# export PATH=/usr/local/go/bin:$HOME/go/bin:$PATH

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# Desktop
export PATH=${XDG_DATA_HOME:-$HOME/.local/share}/fnf/bin:$PATH

# Override tpm installation path because of our taskfile script will remove it
# since the default installation is in the same directory with this tmux conf
export TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins

# Set default editor to nvim
export EDITOR="nvim"

# Set default terminal emulator, some applications may use this
export TERMINAL="kitty"

# Less command behavior, consult `less --help OR man less`
export LESS="-SRXF"

# Debian based distro conflict package name handling
if (( ${+commands[fdfind]} )); then
  if [ ! -L "${HOME}/.local/bin/fd" ]; then
    ln -sf $(which fdfind) "${HOME}/.local/bin/fd"
  fi

  export FZF_ALT_C_COMMAND="fd --type directory --hidden --exclude .git"
fi

if (( ${+commands[fd]} )); then
  # FZF ALT-C comamnd for search directory
  export FZF_ALT_C_COMMAND="fd --type directory --hidden --exclude .git"
fi

if (( ${+commands[mise]} )); then
  source <(mise completion zsh)
  eval "$(mise activate zsh)"
fi

if (( ${+commands[oh-my-posh]} )); then
    if [ -f "${HOME}/.config/oh-my-posh/omp.json" ]; then
        eval "$(oh-my-posh init zsh --config ${HOME}/.config/oh-my-posh/omp.json)"
    else
        eval "$(oh-my-posh init zsh)"
    fi
fi

if (( ${+commands[zoxide]} )); then
  eval "$(zoxide init zsh)"
fi

if (( ${+commands[task]} )); then
  source <(task --completion zsh)
fi

if (( ${+commands[k9s]} )); then
  source <(k9s completion zsh)
fi

if (( ${+commands[yazi]} )); then
  function y() {
	  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	  command yazi "$@" --cwd-file="$tmp"
	  IFS= read -r -d '' cwd < "$tmp"
	  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	  rm -f -- "$tmp"
  }
fi
