# Java
# Create symlink
# sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
export JAVA_HOME="`/usr/libexec/java_home`"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# PHP (Composer)
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
eval "$(rbenv init - zsh)"

# Rust
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Node (Node Version Manager)
#export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
eval "$(fnm env --use-on-cd)"

# DevKitPro
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=${DEVKITPRO}/devkitARM
export DEVKITPPC=${DEVKITPRO}/devkitPPC
export PATH=${DEVKITPRO}/tools/bin:$PATH

# Google Cloud SDK
[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
