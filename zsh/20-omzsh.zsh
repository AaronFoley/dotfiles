# Path to your Oh My Zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/oh-my-zsh-custom"

ZSH_THEME="robbyrussell"

plugins=(
  git
  sudo
  web-search
  archlinux
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  copyfile
  copybuffer
  dirhistory
)

source $ZSH/oh-my-zsh.sh

# Oh My Posh

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/custom.omp.json)"
