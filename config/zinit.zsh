### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load plugins configurations
zinit snippet $ZSH_CONFIG/plugins/zsh-autosuggestions.zsh
zinit snippet $ZSH_CONFIG/plugins/dotenv.zsh
zinit snippet $ZSH_CONFIG/plugins/vimode.zsh

# OMZ
# OMZ Libraries
zi snippet OMZL::clipboard.zsh
zi snippet OMZL::directories.zsh
zi snippet OMZL::functions.zsh
zi snippet OMZL::git.zsh
zi snippet OMZL::grep.zsh
zi snippet OMZL::key-bindings.zsh
zi snippet OMZL::termsupport.zsh
# OMZ Plugins (Functional)
zi snippet OMZP::copybuffer
zi snippet OMZP::copyfile
zi snippet OMZP::copypath
zi snippet OMZP::dotenv
zi snippet OMZP::git-auto-fetch
zi snippet OMZP::iterm2
zi snippet OMZP::fzf
zi snippet OMZP::vi-mode
zi snippet OMZP::zsh-interactive-cd
zi snippet OMZP::z
# OMZ Plugins (Aliases)
zi snippet OMZP::docker
zi snippet OMZP::docker-compose
zi snippet OMZP::kubectl
zi snippet OMZP::python
zi snippet OMZP::git
zi snippet OMZP::git-lfs
zi snippet OMZP::golang
zi snippet OMZP::gitignore
zi snippet OMZP::npm
zi snippet OMZP::pip
zi snippet OMZP::rust
zi snippet OMZP::terraform
zi snippet OMZP::vscode
zi snippet OMZP::xcode
zi snippet OMZP::yarn
# OMZ Plugins (Completion)
zi snippet OMZP::git-extras
zi snippet OMZP::git-flow-avh
zi snippet OMZP::gh
zi snippet OMZP::rsync

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Themes
# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# Load starship theme
# line 1: `starship` binary as command, from github release
# line 2: starship setup at clone(create init.zsh, completion)
# line 3: pull behavior same as clone, source init.zsh
# zinit ice as"command" from"gh-r" \
#           atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
#           atpull"%atclone" src"init.zsh"
# zinit light starship/starship
