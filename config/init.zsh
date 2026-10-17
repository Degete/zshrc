# Set the path of zsh configuration directory
export ZSH_HOME=$HOME/.zsh
export ZSH_CONFIG=$ZSH_HOME/config

# Homebrew
[ -f $ZSH_CONFIG/brew.zsh ] && source $ZSH_CONFIG/brew.zsh

# General
[ -f $ZSH_CONFIG/general.zsh ] && source $ZSH_CONFIG/general.zsh

# Paths
[ -f $ZSH_CONFIG/paths.zsh ] && source $ZSH_CONFIG/paths.zsh

# Plugins
[ -f $ZSH_CONFIG/plugins.zsh ] && source $ZSH_CONFIG/plugins.zsh

# Prompt
[ -f $ZSH_CONFIG/prompt.zsh ] && source $ZSH_CONFIG/prompt.zsh

# Hooks
[ -f $ZSH_CONFIG/hooks.zsh ] && source $ZSH_CONFIG/hooks.zsh

# Aliases
[ -f $ZSH_CONFIG/aliases.zsh ] && source $ZSH_CONFIG/aliases.zsh

# Terminals
[ -f $ZSH_CONFIG/terminals.zsh ] && source $ZSH_CONFIG/terminals.zsh

# Local config
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
