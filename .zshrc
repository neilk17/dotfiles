typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

PROMPT='%~ %'

# Vim mode
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^R' history-incremental-search-backward

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias vi="nvim"
alias wv="NVIM_APPNAME=write nvim"
alias ,new='NVIM_APPNAME=write nvim "$(date +%Y-%m-%d).md"'
alias ls="eza --icons=always" # better ls
[[ -o interactive ]] && alias cd="z"
alias lg="lazygit"
alias mutt="neomutt"
alias tag="node ~/writing/ai/index.js"
alias findtag='grep "^tags:.*"'
alias j="./journal.py --dir ."



# Enable history-based autocompletion
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Bind keys for history completion
bindkey "^[[A" up-line-or-beginning-search # Up arrow
bindkey "^[[B" down-line-or-beginning-search # Down arrow
bindkey -M emacs "^P" up-line-or-beginning-search
bindkey -M emacs "^N" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Configure completion system for better history matching
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
NVM_PREFIX="/opt/homebrew/opt/nvm"
[ -s "$NVM_PREFIX/nvm.sh" ] && source "$NVM_PREFIX/nvm.sh"


# pnpm
export PNPM_HOME="/Users/neil/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
# pnpm end
#
# bun completions
[ -s "/Users/neil/.bun/_bun" ] && source "/Users/neil/.bun/_bun"


# Added by Windsurf
export PATH="/Users/neil/.codeium/windsurf/bin:$PATH"

# Created by `pipx` on 2025-07-28 09:43:37
export PATH="$PATH:/Users/neil/.local/bin"

. "$HOME/.turso/env"

# opencode
export PATH=/Users/neil/.opencode/bin:$PATH


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Initialize autocompletion
autoload -U compinit
compinit


# Added by Antigravity
export PATH="/Users/neil/.antigravity/antigravity/bin:$PATH"


# Docker Desktop
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"
