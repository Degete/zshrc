ZINIT_HOME=${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git
[[ -d $ZINIT_HOME ]] || command git clone https://github.com/zdharma-continuum/zinit $ZINIT_HOME
source $ZINIT_HOME/zinit.zsh

# Entries without `wait` load before the first prompt. The rest load in turbo mode, right after it,
# in stages (and in file order within a stage):
#   wait (same as 0a): everything that doesn't need compinit, including all that adds completions
#       (compdefs, fpath), as compinit only picks up what's there
#   0b: compinit, then fzf-tab, which must load after it but before plugins that wrap widgets
#   0c: what needs compinit (bash-style completions) and the widget wrappers
#       (autosuggestions before syntax highlighting)
# zinit queues compdef/complete calls made while a plugin's files load, so plugins doing that after
# compinit need `zicdreplay`. Calls from an `atload` run after that, so they apply directly.

# Plugin config
source $ZSH_CONFIG/plugins/zsh-autosuggestions.zsh
source $ZSH_CONFIG/plugins/vimode.zsh
source $ZSH_CONFIG/plugins/you-should-use.zsh

# OMZ Libraries (needed before the first prompt: history, keymaps, paste handling)
zinit for \
    OMZL::functions.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::misc.zsh

zinit wait lucid for \
    OMZL::clipboard.zsh \
    OMZL::completion.zsh \
    OMZL::correction.zsh \
    OMZL::directories.zsh \
    OMZL::git.zsh \
    OMZL::grep.zsh \
    OMZL::termsupport.zsh

# OMZ Plugins
# Keymaps needed before the first prompt
zinit for \
    OMZP::vi-mode

# Functional
zinit wait lucid for \
    OMZP::copybuffer \
    OMZP::copyfile \
    OMZP::copypath \
    OMZP::iterm2

# Aliases
zinit wait lucid for \
    OMZP::brew \
    OMZP::docker \
    OMZP::docker-compose \
    OMZP::kubectl \
    OMZP::python \
    OMZP::git \
    OMZP::git-lfs \
    OMZP::golang \
    OMZP::gitignore \
    OMZP::npm \
    OMZP::terraform \
    OMZP::vscode \
    OMZP::xcode

# Completions
zinit wait lucid for \
    OMZP::git-extras \
    OMZP::rsync \
    has"terraform" as"completion" \
        OMZP::terraform/_terraform

# With extra files (snippets only download the main file)
zinit wait lucid for \
    if'[[ $OSTYPE == darwin* ]]' \
    atclone'for f in music spotify _security; do command curl -fsSLO https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/macos/$f; done' \
    atpull'%atclone' \
        OMZP::macos \
    has"tmux" \
    atclone'for f in tmux.extra.conf tmux.only.conf; do command curl -fsSLO https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/tmux/$f; done' \
    atpull'%atclone' \
        OMZP::tmux

# Needs compinit (bash-style `complete`)
zinit wait"0c" lucid for \
    has"tofu" atload"zicdreplay -q" \
        OMZP::opentofu

# GitHub Plugins
zinit wait lucid for \
    MichaelAquilina/zsh-you-should-use \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

# compinit runs in fzf-tab's atinit, so it always runs right before it, wherever it's placed.
# `-C` skips its check for new completion files (~300ms on every shell), so after adding a plugin
# or tool with completions, rebuild the dump: `rm ~/.zcompdump*`, then open a new shell.
# fzf (Ctrl+R history, Ctrl+T files, Alt+C cd) loads right after fzf-tab, so `**<Tab>` goes to fzf
# and any other Tab falls back to fzf-tab
zinit wait"0b" lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    atload"source $ZSH_CONFIG/plugins/fzf-tab.zsh; source $ZSH_CONFIG/plugins/fzf.zsh" \
        Aloxaf/fzf-tab

zinit wait"0c" lucid for \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    zdharma-continuum/fast-syntax-highlighting

# Local (Homebrew)

# gcloud: only its completion file (Homebrew already links gcloud into PATH, so the SDK's
# path.zsh.inc, which OMZP::gcloud sources, isn't needed). Needs compinit (bash-style `complete`)
zinit wait"0c" lucid for \
    has"gcloud" id-as"gcloud-completion" \
    atload'source $HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc' \
        zdharma-continuum/null

# zoxide: smarter cd (`z foo`, `zi` for an fzf picker), tracks directories through a chpwd hook.
# Loaded here, after compinit, as its init only registers the `z` completion if compinit already ran
# (`z foo<Tab>`: local directories; `z foo<Space><Tab>`: zoxide's own picker with its matches)
zinit wait"0c" lucid for \
    has"zoxide" id-as"zoxide-init" \
    atload'eval "$(zoxide init zsh)"' \
        zdharma-continuum/null
