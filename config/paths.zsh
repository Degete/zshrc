# Keep PATH entries unique
typeset -U path

# User binaries, appended so they don't shadow Homebrew versions
[ -d "$HOME/.local/bin" ] && path+=("$HOME/.local/bin")

# Java, Node, Ruby and Terraform versions are managed by mise (see hooks.zsh and ~/.config/mise/config.toml)

# CURL
[ -d "$HOMEBREW_PREFIX/opt/curl/bin" ] && path=("$HOMEBREW_PREFIX/opt/curl/bin" $path)

# PHP (Composer)
[ -d "$HOME/.composer/vendor/bin" ] && path=("$HOME/.composer/vendor/bin" $path)

# Android
if [ -d "$HOME/Library/Android/sdk" ]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  path+=($ANDROID_HOME/{emulator,platform-tools,cmdline-tools/latest/bin}(N/))
fi

# Ruby (Homebrew's is the global default; projects with .ruby-version use mise)
if [ -d "$HOMEBREW_PREFIX/opt/ruby/bin" ]; then
  path=("$HOMEBREW_PREFIX/opt/ruby/bin" $path)
  # Executables installed with `gem install` (newest Ruby version's gem dir)
  path+=($HOMEBREW_PREFIX/lib/ruby/gems/*/bin(Nn/[-1]))
fi

# Rust
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Golang
[ -d "$HOME/go/bin" ] && path+=("$HOME/go/bin")

# DevKitPro
if [ -d "/opt/devkitpro" ]; then
  export DEVKITPRO=/opt/devkitpro
  export DEVKITARM=${DEVKITPRO}/devkitARM
  export DEVKITPPC=${DEVKITPRO}/devkitPPC
  path=(${DEVKITPRO}/tools/bin $path)
fi
