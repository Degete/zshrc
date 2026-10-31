export STARSHIP_CONFIG=$ZSH_CONFIG/starship/config.toml

(( $+commands[starship] )) && eval "$(starship init zsh)"
