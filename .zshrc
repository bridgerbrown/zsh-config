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

function cf-zsh() {
  nvim ~/.zshrc
}

function cf-nvim() {
  cd 
  cd .config/nvim
  nvim
}

function cf-kitty() {
  cd 
  cd .config/kitty
  nvim
}

# PATHS
export PATH="/usr/local/bin:$PATH"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function tableplus() {
  open /Applications/TablePlus.app/Contents/MacOS/TablePlus
}

# PROMPT
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%1~%f %F{red}${vcs_info_msg_0_}%f$ '
