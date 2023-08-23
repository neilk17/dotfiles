# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/neil/.oh-my-zsh"
source ~/.bash_profile
# export PATH="~/.local/bin/lvim:$PATH"
# alias lvim="/Users/neil/.local/bin/lvim"
# alias lvim="/Users/neil/.local/bin/lvim"

# Theme
ZSH_THEME="robbyrussell"

# Enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the follo"wing line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    vi-mode
)

source $ZSH/oh-my-zsh.sh
export VI_MODE_SET_CURSOR=true
export TERM="xterm-256color"


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias lv="NVIM_APPNAME=LazyVim nvim"
alias vn="NVIM_APPNAME=nvim-neil nvim"
alias kv="NVIM_APPNAME=kickstart nvim"
function nvims() {
  items=("nvim-neil" "LazyVim" "kickstart")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "vs\n"

alias yabairc="nvim ~/.config/yabai/yabairc"
alias skhdrc="nvim ~/.config/skhd/skhdrc"
alias v="nvim"
alias zsh="nvim ~/.zshrc"
alias activate="source venv/bin/activate"
alias config='/usr/bin/git --git-dir=/Users/neil/.dotfiles/ --work-tree=/Users/neil'
export PATH="/usr/local/sbin:$PATH"
[ -f "/Users/neil/.ghcup/env" ] && source "/Users/neil/.ghcup/env" # ghcup-env

alias del="trash"


export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
eval export PATH="/Users/neil/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
unset JDK_HOME
source '/opt/homebrew/Cellar/jenv/0.5.5_2/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
# source $(brew --prefix nvm)/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source $(brew --prefix nvm)/nvm.sh

# Shell Integration
source ~/.iterm2_shell_integration.zsh
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/neil/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
alias lg='lazygit'
