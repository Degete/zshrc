# Set the path of zsh configuration directory
export ZSH_HOME=$HOME/.zsh
export ZSH_CONFIG=$ZSH_HOME/config

# General
[ -f $ZSH_CONFIG/general.zshrc ] && source $ZSH_CONFIG/general.zshrc

# p10k init
[ -f $ZSH_CONFIG/p10k/p10k-instant-prompt.zsh ] && source $ZSH_CONFIG/p10k/p10k-instant-prompt.zsh

# Paths
[ -f $ZSH_CONFIG/paths.zshrc ] && source $ZSH_CONFIG/paths.zshrc

# Package manager
[ -f $ZSH_CONFIG/oh-my-zsh.zshrc ] && source $ZSH_CONFIG/oh-my-zsh.zshrc

# Aliases
[ -f $ZSH_CONFIG/aliases.zshrc ] && source $ZSH_CONFIG/aliases.zshrc

# p10k (To customize prompt, run `p10k configure` or edit $ZSH_CONFIG/p10k/p10k.zsh)
[ -f $ZSH_CONFIG/p10k/p10k.zsh ] && source $ZSH_CONFIG/p10k/p10k.zsh

# Terminals
[ -f $ZSH_CONFIG/terminals.zshrc ] && source $ZSH_CONFIG/terminals.zshrc

# Local config
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local