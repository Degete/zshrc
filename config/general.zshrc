# Terminal
export TERM="xterm-256color"

# Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="$( echo $(which nvim) || echo $(which vim) || echo $(which vi) )"
else
  export EDITOR="$( echo $(which nvim) || echo $(which vim) || echo $(which vi) )"
fi
