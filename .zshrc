# ZSH GENERAL
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
export TERMINAL=kitty

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# SHORTCUTS
function ncd() {
  cd "$1" && nvim
}

function cfzsh() {
  nvim ~/.zshrc
}

function cfnvim() {
  cd 
  cd .config/nvim
  nvim
}

function cfkitty() {
  cd 
  cd .config/kitty
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
export PATH="/opt/homebrew/opt/postgresql@10/bin:$PATH"
export PGDATA=/var/lib/postgresql/10/main/
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh_secrets
export NVIM_SWAP_DIR="$HOME/.local/state/nvim/swap/"

function tableplus() {
  open /Applications/TablePlus.app/Contents/MacOS/TablePlus
}

# PROMPT
autoload -Uz vcs_info
precmd() { vcs_info }

# Kanagawa colors
# PROMPT='%F{#98bb6c}[%1~]%f %F{#dcd7ba}${vcs_info_msg_0_}%f%F{#967fb8}#%f '

PROMPT='%(?.%F{green}⏺.%F{red}⏺)%f %2~ %# '
# Autoload zsh's `add-zsh-hook` and `vcs_info` functions
# (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Set prompt substitution so we can use the vcs_info_message variable
setopt prompt_subst
# Run the `vcs_info` hook to grab git info before displaying the prompt
add-zsh-hook precmd vcs_info
# Style the vcs_info message
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
# Format when the repo is in an action (merge, rebase, etc)
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true

# Set the right prompt to the vcs_info message
RPROMPT='⎇ ${vcs_info_msg_0_}'

# NEW TERMINAL SESSION MESSAGE
#echo -e "┏━━━━━━━━━━━━━━━━━━━━━━┓"
#echo -e "$(whoami) [ $(date +"%I:%M %p - %a, %m/%d/%y") ]"
#echo -e "┗━━━━━━━━━━━━━━━━━━━━━━┛"
echo -e "$(whoami)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
