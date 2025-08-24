#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Golang
export PATH=/usr/local/go/bin:$HOME/go/bin:$PATH

# Desktop
export PATH=${XDG_DATA_HOME:-$HOME/.local/share}/fnf/bin:$PATH
