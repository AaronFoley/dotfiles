# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey -v   # Default to standard vi bindings, regardless of editor string

bindkey "^[[2~" overwrite-mode      # insert
bindkey "^[[3~" delete-char         # delete
bindkey "^[[7~" beginning-of-line   # home
bindkey "^[[8~" end-of-line         # end
