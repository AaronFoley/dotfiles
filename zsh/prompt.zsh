ps1_hostname() {
    # If we are my own user, no need to show
    if [[ $(whoami) != 'aaron' && $(whoami) != 'afoley' ]]; then
      line="%n%f@%m"
    else
        line="%m"
    fi
    # Convert to red if we are root
    if [ $(id -u) -eq 0 ]; then
      line="%F{red}$line"
    fi
    if [[ -n "$line" ]]; then
      echo "$line "
    fi
}

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
PRIMARY_FG=black

# Characters
SEGMENT_SEPARATOR="\ue0b0"

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
    local bg fg
    [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
    [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
    if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
        print -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
    else
        print -n "%{$bg%}%{$fg%}"
    fi
    CURRENT_BG=$1
    [[ -n $3 ]] && print -n $3
}

# End the prompt, closing any open segments
prompt_end() {
    if [[ -n $CURRENT_BG ]]; then
        print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
    else
        print -n "%{%k%}"
    fi
    print -n "%{%f%}"
    CURRENT_BG=''
}

# # Default values for the appearance of the prompt. Configure at will.
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH=""
ZSH_THEME_GIT_PROMPT_STAGED="%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

# Don't reset any colours ...
git_super_status() {
    precmd_update_git_vars
    if [ "$GIT_BRANCH" != ":" ]; then
        STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH%"
        if [ "$GIT_BEHIND" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND"
        fi
        if [ "$GIT_AHEAD" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD"
        fi
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
        if [ "$GIT_STAGED" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED"
        fi
        if [ "$GIT_CONFLICTS" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS"
        fi
        if [ "$GIT_CHANGED" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED"
        fi
        if [ "$GIT_UNTRACKED" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
        fi
        if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
        fi
        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
        echo "$STATUS"
    fi
}

function build_prompt {
    prompt_segment black default  "$FG[068] $(ps1_hostname)"
    prompt_segment blue black ' %~ '
    if [ "$(git_super_status)" != "" ]; then
        prompt_segment 255 black " $(git_super_status) "
    fi
    prompt_end
}

PROMPT='$(build_prompt)
 %B$FG[068]❯%f%b '
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
