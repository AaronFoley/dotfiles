# Path to your Oh My Zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/oh-my-zsh-custom"

zstyle ':omz:alpha:lib:git' async-prompt no

ZSH_THEME="bullet-train"

BULLETTRAIN_PROMPT_CHAR="❯"

BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  context
  dir
  virtualenv
  kctx
  git
  go
  rust
  elixir
  cmd_exec_time
)

BULLETTRAIN_TIME_BG="black"
BULLETTRAIN_TIME_FG="default"

plugins=(git)

source $ZSH/oh-my-zsh.sh
