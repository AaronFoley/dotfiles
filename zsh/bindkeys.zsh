# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey -v   # Default to standard vi bindings, regardless of editor string

bindkey "^[[2~" overwrite-mode
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-search
bindkey "^[[6~" down-line-or-search
bindkey "^[[1~" beginning-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[8~" end-of-line
bindkey "^?" backward-delete-char
bindkey '^R' history-incremental-search-backward
