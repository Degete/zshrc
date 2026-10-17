# Loaded right after fzf-tab, so it runs after the OMZ completion lib and can override its styles

# Let fzf-tab handle the menu (same pattern as the OMZ completion lib, which sets `menu select`)
zstyle ':completion:*:*:*:*:*' menu no
# Group completions by their description
zstyle ':completion:*:descriptions' format '[%d]'
# Keep git checkout branches in their natural (recent first) order
zstyle ':completion:*:git-checkout:*' sort false
# Switch between groups with < and >
zstyle ':fzf-tab:*' switch-group '<' '>'

# Preview directories with eza and files with bat
zstyle ':fzf-tab:complete:*:*' fzf-preview '
  if [[ -d $realpath ]]; then
    eza -1 --color=always --icons $realpath 2>/dev/null || ls -1 $realpath
  elif [[ -f $realpath ]]; then
    bat --color=always --style=numbers --line-range=:200 $realpath 2>/dev/null || head -200 $realpath
  fi'
