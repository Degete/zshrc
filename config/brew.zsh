# Homebrew environment (HOMEBREW_* vars, PATH, MANPATH, INFOPATH and fpath for completions).
# Loaded first so the rest of the config can find Homebrew commands.
# Prefers the Apple Silicon prefix over the Intel (Rosetta) one when both exist.
for _brew in /opt/homebrew/bin/brew /usr/local/bin/brew; do
  if [[ -x $_brew ]]; then
    eval "$($_brew shellenv zsh)"
    break
  fi
done
unset _brew
