# Enable brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Prompt
setopt PROMPT_SUBST

git_prompt_info() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        local git_branch
        git_branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
        local git_status
        git_status=$(git status --porcelain 2>/dev/null)
        if [ -n "$git_status" ]; then
            echo "%F{magenta}${git_branch}*%f"
        else
            echo "%F{magenta}${git_branch}%f"
        fi
    fi
}

PROMPT='%F{yellow}%~ $(git_prompt_info)%f '

# Aliases
source $XDG_CONFIG_HOME/.aliases

# Autocompletion
autoload -U compinit; compinit

# Remove lag on vim mode change and fix backspace issue
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char

