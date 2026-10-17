ZINIT_HOME=${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git
[[ -d $ZINIT_HOME ]] || command git clone https://github.com/zdharma-continuum/zinit $ZINIT_HOME
source $ZINIT_HOME/zinit.zsh

# Scan fpath for completions (full compinit) at most once a day, otherwise reuse the cached dump.
# After installing new completions, run `rm ~/.zcompdump` to pick them up right away
_zinit_compinit() {
  local dump=${ZDOTDIR:-$HOME}/.zcompdump
  local -a stale=($dump(N.mh+24))
  autoload -Uz compinit
  if [[ ! -s $dump || -n $stale ]]; then
    compinit -d $dump && command touch $dump
  else
    compinit -C -d $dump
  fi
}

# Load plugins configurations
source $ZSH_CONFIG/plugins/zsh-autosuggestions.zsh
source $ZSH_CONFIG/plugins/vimode.zsh
source $ZSH_CONFIG/plugins/you-should-use.zsh

# OMZ Libraries (needed before the first prompt: history, keymaps, paste handling)
zinit for \
    OMZL::functions.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::misc.zsh
# OMZ Plugins (keymaps needed before the first prompt)
zinit for \
    OMZP::vi-mode

# Everything below is loaded in turbo mode, right after the first prompt

# OMZ Libraries
zinit wait lucid for \
    OMZL::clipboard.zsh \
    OMZL::completion.zsh \
    OMZL::correction.zsh \
    OMZL::directories.zsh \
    OMZL::git.zsh \
    OMZL::grep.zsh \
    OMZL::termsupport.zsh
# OMZ Plugins (Functional)
zinit wait lucid for \
    OMZP::copybuffer \
    OMZP::copyfile \
    OMZP::copypath \
    OMZP::git-auto-fetch \
    OMZP::iterm2 \
    MichaelAquilina/zsh-you-should-use
# OMZ Plugins (Aliases)
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
    OMZP::rust \
    OMZP::terraform \
    OMZP::vscode \
    OMZP::xcode
# OMZ Plugins (Completion)
zinit wait lucid for \
    OMZP::git-extras \
    OMZP::rsync
# OMZ Plugins with extra files (snippets only download the main file)
zinit wait lucid for \
    if'[[ $OSTYPE == darwin* ]]' \
    atclone'for f in music spotify _security; do command curl -fsSLO https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/macos/$f; done' \
    atpull'%atclone' \
        OMZP::macos \
    has"tmux" \
    atclone'for f in tmux.extra.conf tmux.only.conf; do command curl -fsSLO https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/tmux/$f; done' \
    atpull'%atclone' \
        OMZP::tmux

# Completion and line editor plugins (order matters)
# 1. zsh-completions must be in fpath before compinit
# 2. compinit runs once, after all snippets above have registered their compdefs
# 3. fzf-tab must load after compinit, but before plugins that wrap widgets
# 4. fzf (Ctrl+R history, Ctrl+T files, Alt+C cd) right after fzf-tab, so `**<Tab>` goes to fzf
#    and any other Tab falls back to fzf-tab
# 5. gcloud completion (needs compinit; Homebrew already links gcloud into PATH, so the
#    SDK's path.zsh.inc, which OMZP::gcloud sourced, isn't needed)
# 6. autosuggestions and syntax highlighting go last
zinit wait lucid for \
    blockf \
        zsh-users/zsh-completions \
    atinit"_zinit_compinit; zicdreplay" \
    atload"source $ZSH_CONFIG/plugins/fzf-tab.zsh; source $ZSH_CONFIG/plugins/fzf.zsh" \
        Aloxaf/fzf-tab \
    has"gcloud" id-as"gcloud-completion" \
    atload'source ${HOMEBREW_PREFIX:-/opt/homebrew}/share/google-cloud-sdk/completion.zsh.inc' \
        zdharma-continuum/null \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
        zdharma-continuum/fast-syntax-highlighting
