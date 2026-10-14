# Keep PATH entries unique
typeset -U path

# Java
# Create symlink
# sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
if JAVA_HOME="$(/usr/libexec/java_home 2> /dev/null)"; then # Add -v XX to set specific version
  export JAVA_HOME
  path=("$JAVA_HOME/bin" $path)
else
  unset JAVA_HOME
fi

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

# Ruby
[ -d "/opt/homebrew/opt/ruby/bin" ] && path=("/opt/homebrew/opt/ruby/bin" $path)
if (( $+commands[rbenv] )); then
  path=("${RBENV_ROOT:-$HOME/.rbenv}/shims" $path)
  export RBENV_SHELL=zsh
  rbenv() {
    unfunction rbenv
    eval "$(command rbenv init - zsh)"
    rbenv "$@"
  }
fi

# Rust
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
path+=($GOBIN)

# Terraform
[ -d "$HOME/.tfenv/bin" ] && path=("$HOME/.tfenv/bin" $path)

# Node
# nvm is loaded lazily by the oh-my-zsh nvm plugin
export NVM_DIR="$HOME/.nvm"

# DevKitPro
if [ -d "/opt/devkitpro" ]; then
  export DEVKITPRO=/opt/devkitpro
  export DEVKITARM=${DEVKITPRO}/devkitARM
  export DEVKITPPC=${DEVKITPRO}/devkitPPC
  path=(${DEVKITPRO}/tools/bin $path)
fi
