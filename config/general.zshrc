# Editor
export EDITOR="${commands[nvim]:-${commands[vim]:-vi}}"

# Need to use gpg-agent with pinentry in macOS (faster version https://unix.stackexchange.com/questions/608842/zshrc-export-gpg-tty-tty-says-not-a-tty)
export GPG_TTY=$TTY # $(tty)

# Telemetry & Tracking
export HOMEBREW_NO_ANALYTICS=1

export DISABLE_TELEMETRY=1
export DO_NOT_TRACK=1

export SAM_CLI_TELEMETRY=0
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export AZURE_CORE_COLLECT_TELEMETRY=0
