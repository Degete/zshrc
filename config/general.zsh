# Editor
export EDITOR="${commands[nvim]:-${commands[vim]:-vi}}"

# Need to use gpg-agent with pinentry in macOS (faster version https://unix.stackexchange.com/questions/608842/zshrc-export-gpg-tty-tty-says-not-a-tty)
export GPG_TTY=$TTY # $(tty)

# History (set before the OMZ history lib)
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups # remove the older duplicate when a command is re-entered
setopt hist_reduce_blanks   # remove superfluous blanks before recording
