# Keep PATH entries unique
typeset -U path

# User binaries, appended so they don't shadow Homebrew versions
[ -d "$HOME/.local/bin" ] && path+=("$HOME/.local/bin")

# Java, Node, Ruby and Terraform versions are managed by mise (see hooks.zsh and ~/.config/mise/config.toml)

# CURL
[ -d "/opt/homebrew/opt/curl/bin" ] && path=("/opt/homebrew/opt/curl/bin" $path)

# PHP (Composer)
[ -d "$HOME/.composer/vendor/bin" ] && path=("$HOME/.composer/vendor/bin" $path)

# Android
if [ -d "$HOME/Library/Android/sdk" ]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export ANDROID_SDK=$ANDROID_HOME
  path+=(
    $ANDROID_HOME/emulator
    $ANDROID_HOME/tools
    $ANDROID_HOME/tools/bin
    $ANDROID_HOME/platform-tools
  )
fi

# Ruby (Homebrew's is the global default; projects with .ruby-version use mise)
[ -d "/opt/homebrew/opt/ruby/bin" ] && path=("/opt/homebrew/opt/ruby/bin" $path)

# Rust
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Golang
if (( $+commands[go] )); then
  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  path+=($GOBIN)
fi

# DevKitPro
if [ -d "/opt/devkitpro" ]; then
  export DEVKITPRO=/opt/devkitpro
  export DEVKITARM=${DEVKITPRO}/devkitARM
  export DEVKITPPC=${DEVKITPRO}/devkitPPC
  path=(${DEVKITPRO}/tools/bin $path)
fi
