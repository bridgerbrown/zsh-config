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

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{#98bb6c}[%1~]%f %F{#dcd7ba}${vcs_info_msg_0_}%f%F{#967fb8}#%f '

# NEW TERMINAL SESSION MESSAGE
#echo -e "┏━━━━━━━━━━━━━━━━━━━━━━┓"
#echo -e "$(whoami) [ $(date +"%I:%M %p - %a, %m/%d/%y") ]"
#echo -e "┗━━━━━━━━━━━━━━━━━━━━━━┛"
echo -e "$(whoami)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
