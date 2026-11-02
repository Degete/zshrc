# Falls back to direnv when mise is not installed, as mise's [env] covers direnv's use case.
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
elif (( $+commands[direnv] )); then
  # Load/unload .envrc (and .env, see ~/.config/direnv/direnv.toml) when changing directories
  eval "$(direnv hook zsh)"
fi

# zoxide is loaded with the plugins (plugins.zsh), see its `z` completion there
