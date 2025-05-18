# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Golang
export PATH=/usr/local/go/bin:$HOME/go/bin:$PATH

# Snap weirdly get omitted sometimes from path
export PATH=/snap/bin:$PATH

# Override tpm installation path because of our taskfile script will remove it
# since the default installation is in the same directory with this tmux conf
export TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins

