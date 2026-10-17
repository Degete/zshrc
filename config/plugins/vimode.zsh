# vi-mode cursor
VI_MODE_SET_CURSOR=true

# Switch modes instantly on Esc (default waits 0.4s for a multi-key sequence)
KEYTIMEOUT=1

# Emacs-style start/end of line in insert mode
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
