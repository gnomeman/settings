# Spaceship
source $ZSH_PLUGIN_DIR/spaceship/spaceship.zsh-theme

# Fast Syntax Highlighting
source $ZSH_PLUGIN_DIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Autosuggestions
source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# History Substring Search
source $ZSH_PLUGIN_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh

# TODO: Move into seperate file
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Completions
fpath=($ZSH_PLUGIN_DIR/zsh-completions/src $fpath)
