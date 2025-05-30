# ZSH GENERAL
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
export TERMINAL=ghostty

plugins=(
  git
)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

# INITIALIZE SECRETS FILE
[ -f ~/.zsh_secrets ] || touch ~/.zsh_secrets
source ~/.zsh_secrets

# SHORTCUTS
function nv() {
  nvim
}

function ncd() {
  cd "$1" && nvim
}

function cfzsh() {
  nvim ~/.zshrc
}

function cfnv() {
  cd 
  cd .config/nvim
  nvim
}

function clear-swapfiles() {
  cd "$NVIM_SWAP_DIR" || return
  ls -la
  rm -f ./*.swp
  ls -la
}

# PATHS
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@10/bin:$PATH"
export PGDATA=/var/lib/postgresql/10/main/
export NVIM_SWAP_DIR="$HOME/.local/state/nvim/swap/"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

function tableplus() {
  open /Applications/TablePlus.app/Contents/MacOS/TablePlus
}

# PROMPT
autoload -Uz vcs_info
precmd() { vcs_info }
PROMPT='%(?.%F{green}⏺.%F{red}⏺)%f %2~ %# '

autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
zstyle ':vcs_info:*:*' check-for-changes true
RPROMPT='⎇ ${vcs_info_msg_0_}'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Created by `pipx` on 2025-04-04 00:51:10
export PATH="$PATH:/Users/bridgerb/.local/bin"
