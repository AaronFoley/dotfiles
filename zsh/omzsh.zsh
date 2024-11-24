# Path to your Oh My Zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/oh-my-zsh-custom"

zstyle ':omz:alpha:lib:git' async-prompt no

ZSH_THEME="bullet-train"

# BULLETTRAIN_PROMPT_CHAR="${WHITE}❯"
BULLETTRAIN_PROMPT_CHAR=("%{$fg[white]%}❯")

BULLETTRAIN_PROMPT_ORDER=(
  status
  dir
  virtualenv
  kctx
  git
  go
  rust
  cmd_exec_time
)

plugins=(git)

source $ZSH/oh-my-zsh.sh
