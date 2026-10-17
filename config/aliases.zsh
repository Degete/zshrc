# Edit this configuration
alias zshconfig="$EDITOR $ZSH_CONFIG/"

# SSH Agent Forwarding by default
alias ssh="ssh -A"

# Homebrew prefix based on arch
[ -f /usr/local/bin/brew ]    && alias xbrew="arch -x86_64 /usr/local/bin/brew"
[ -f /opt/homebrew/bin/brew ] && alias abrew=/opt/homebrew/bin/brew

# Cli tools
(( $+commands[htop] ))             && alias top=htop
(( $+commands[eza] ))              && alias ls='eza --header --group --modified --created --git --icons'
(( $+commands[vim] ))              && alias v=vim
(( $+commands[nvim] ))             && alias n=nvim
(( $+commands[docker] ))           && alias d=docker
(( $+commands[lazygit] ))          && alias lzg=lazygit g=lazygit
(( $+commands[lazydocker] ))       && alias lzd=lazydocker
(( $+commands[kubectl] ))          && alias k=kubectl
(( $+commands[terraform] ))        && alias t=terraform tf=terraform
(( $+commands[chezmoi] ))          && alias cz=chezmoi
(( $+commands[zellij] ))           && alias zj=zellij
(( $+commands[ansible] ))          && alias a=ansible
(( $+commands[ansible-playbook] )) && alias ap=ansible-playbook
