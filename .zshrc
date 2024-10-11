# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PROMPT='%~ %'

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias nv="nvim"
alias kv="NVIM_APPNAME=kickstart nvim"
alias lv="NVIM_APPNAME=LazyVim nvim"
alias ls="eza --icons=always" # better ls
alias cd="z"
alias mutt="neomutt"

export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/neovim/bin:$PATH"


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

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export NVM_DIR="$HOME/.nvm"
# source $(brew --prefix nvm)/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source $(brew --prefix nvm)/nvm.sh

# pnpm
export PNPM_HOME="/Users/neil/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# bun completions
[ -s "/Users/neil/.bun/_bun" ] && source "/Users/neil/.bun/_bun"

dayfile() {
  nvim $(date +%Y-%m-%d).txt
}
