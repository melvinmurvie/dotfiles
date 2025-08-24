# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Golang
export PATH=/usr/local/go/bin:$HOME/go/bin:$PATH

# Desktop
export PATH=${XDG_DATA_HOME:-$HOME/.local/share}/fnf/bin:$PATH

# Override tpm installation path because of our taskfile script will remove it
# since the default installation is in the same directory with this tmux conf
export TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins

# Set default editor to nvim
export EDITOR="nvim"

# Set default terminal emulator, some applications may use this
export TERMINAL="ghostty"

# Activate 'oh-my-posh' if Installed
if (( ${+commands[oh-my-posh]} )); then
    if [ -f "${HOME}/.config/oh-my-posh/omp.json" ]; then
        eval "$(oh-my-posh init zsh --config ${HOME}/.config/oh-my-posh/omp.json)"
    else
        eval "$(oh-my-posh init zsh)"
    fi
fi

# Activate 'mise' if installed
if (( ${+commands[mise]} )); then
  eval "$(mise activate zsh)"
fi
