# Enable brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Prompt
eval "$(starship init zsh)"

# Aliases
source $XDG_CONFIG_HOME/.aliases

# Autocompletion
autoload -U compinit; compinit

# Remove lag on vim mode change and fix backspace issue
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char

