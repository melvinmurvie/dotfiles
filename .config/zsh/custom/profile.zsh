# Set default editor to nvim
export EDITOR="nvim"

# Activate 'oh-my-posh' if Installed
if (( ${+commands[oh-my-posh]} )); then
    if [ -f "${HOME}/.config/oh-my-posh/omp.json" ]; then
        eval "$(oh-my-posh init zsh --config ${HOME}/.config/oh-my-posh/omp.json)"
    else
        eval "$(oh-my-posh init zsh)"
    fi
fi
