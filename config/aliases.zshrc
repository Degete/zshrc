# SSH Agent Forwarding by default
alias ssh="ssh -A"

which htop > /dev/null \
  && alias top=htop

which lsd > /dev/null \
  && alias ls=eza --header --bytes --group --modified --created --extended --git --icons

which fs > /dev/null \
  && alias find=fd

which ccat > /dev/null \
  && alias cat=ccat

which vim > /dev/null \
  && alias v=vim

which nvim > /dev/null \
  && alias n=nvim

which docker > /dev/null \
  && alias d=docker

which lazygit > /dev/null \
  && alias lg=lazygit

which lazydocker > /dev/null \
  && alias ld=lazydocker

which kubectl > /dev/null \
  && alias k=kubectl

which terraform > /dev/null \
  && alias t=terraform

which ansible > /dev/null \
  && alias a=ansible

which ansible-playbook > /dev/null \
  && alias ap=ansible-playbook
