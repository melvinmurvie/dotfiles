# Syntax highlighting
# Debian
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Arch
elif [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Auto suggestions
# Debian
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Arch
elif [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# History substring search, this need to set after `zsh-syntax-highlighting` otherwise it will cause some highlighting bug (flickering)
#   Installed with omz but sourced manually.
source $ZSH/plugins/history-substring-search/history-substring-search.plugin.zsh

# Vi mode
#   Installed with plugins defined in `.zshrc`.
VI_MODE_SET_CURSOR=true
# VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# History substring search
#   Installed with plugins in .zshrc
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
#
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down
# bindkey -M vicmd '^P' history-substring-search-up
# bindkey -M vicmd '^N' history-substring-search-down
# bindkey -M viins '^P' history-substring-search-up
# bindkey -M viins '^N' history-substring-search-down
#
# bindkey -M emacs '^P' history-substring-search-up
# bindkey -M emacs '^N' history-substring-search-down
