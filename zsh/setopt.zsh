# ===== History
HISTFILE=~/.history
HISTSIZE=4096
SAVEHIST=$HISTSIZE

setopt extended_history # save timestamp of command and duration
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt append_history # If this is set, zsh sessions will append their history list to the history file, rather than overwrite it
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt share_history # imports new commands and appends typed commands to history
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
setopt hist_verify # don't execute, just expand history
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first

# ===== Changing Directories
setopt autocd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack

# ===== Completion
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_param_slash # If a parameter is completed whose content is the name of a directory, then add a trailing slash.
setopt auto_remove_slash # When the last character resulting from a completion is a slash and the next character typed is a word delimiter, remove the slash.
setopt complete_in_word # Allow completion from within a word/phrase

unsetopt menu_complete # do not autoselect the first completion entry

# ===== Correction
setopt correct # spelling correction for commands
setopt correctall # spelling correction for arguments

# ===== Expansion and Globbing
setopt badpattern # If a pattern for filename generation is badly formed, print an error. If this option is unset, the pattern will be left unchanged.
setopt nomatch # If a pattern for filename generation has no matches, print an error

# ===== Prompt
setopt prompt_subst # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt

# ===== Scripts and Functions
setopt multios # perform implicit tees or cats when multiple redirections are attempted
