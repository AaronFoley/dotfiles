# History
HISTFILE=~/.history
HISTSIZE=4096
SAVEHIST=$HISTSIZE

# 01 -> changing directories:
  setopt autocd
  setopt autopushd
unsetopt cdablevars
unsetopt chasedots
  setopt chaselinks
  setopt pushdignoredups
unsetopt pushdminus
unsetopt pushdsilent
unsetopt pushdtohome
# 02 -> completion:
  setopt alwayslastprompt
  setopt alwaystoend
  setopt autolist
  setopt automenu
  setopt autonamedirs
  setopt autoparamkeys
  setopt autoparamslash
  setopt autoremoveslash
unsetopt bashautolist
  setopt completealiases
  setopt completeinword
unsetopt globcomplete
  setopt hashlistall
  setopt listambiguous
unsetopt listbeep
  setopt listpacked
unsetopt listrowsfirst
  setopt listtypes
unsetopt menucomplete
unsetopt recexact
# 03 -> expansion and globbing:
  setopt badpattern
  setopt bareglobqual
unsetopt braceccl
  setopt caseglob
  setopt casematch
unsetopt cshnullglob
  setopt equals
  setopt extendedglob
  setopt glob
unsetopt globassign
  setopt globdots
unsetopt globsubst
unsetopt histsubstpattern
unsetopt ignorebraces
unsetopt kshglob
unsetopt magicequalsubst
  setopt markdirs
  setopt multibyte
  setopt nomatch
unsetopt nullglob
  setopt numericglobsort
unsetopt rcexpandparam
unsetopt rematchpcre
unsetopt shglob
unsetopt warncreateglobal
# 04 -> history:
  setopt appendhistory
  setopt banghist
unsetopt extendedhistory
unsetopt histallowclobber
unsetopt histbeep
  setopt histexpiredupsfirst
unsetopt histfcntllock
  setopt histfindnodups
unsetopt histignorealldups
  setopt histignoredups
  setopt histignorespace
  setopt histnofunctions
  setopt histnostore
  setopt histreduceblanks
unsetopt histsavebycopy
unsetopt histsavenodups
  setopt histverify
  setopt incappendhistory
unsetopt sharehistory
# 05 -> initilisation:
unsetopt allexport
unsetopt globalexport
unsetopt globalrcs
  setopt rcs
# 06 -> input/output:
  setopt aliases
unsetopt clobber
  setopt correct
unsetopt correctall
  setopt dvorak
  setopt flowcontrol
unsetopt ignoreeof
unsetopt interactivecomments
  setopt hashcmds
  setopt hashdirs
unsetopt mailwarning
unsetopt pathdirs
unsetopt printeightbit
unsetopt printexitvalue
unsetopt rcquotes
unsetopt rmstarsilent
unsetopt rmstarwait
  setopt shortloops
unsetopt sunkeyboardhack
# 07 -> job control:
  setopt autocontinue
unsetopt autoresume
  setopt bgnice
  setopt checkjobs
  setopt hup
  setopt longlistjobs
  setopt monitor
  setopt notify
# 08 -> prompting:
  setopt promptbang
  setopt promptcr
  setopt promptsp
  setopt promptpercent
  setopt promptsubst
  setopt prompt_subst
unsetopt transientrprompt
# 09 -> scripts and functions:
unsetopt cbases
unsetopt cprecedences
  setopt debugbeforecmd
unsetopt errexit
unsetopt errreturn
  setopt evallineno
  setopt exec
  setopt functionargzero
unsetopt localoptions
unsetopt localtraps
  setopt multifuncdef
  setopt multios
unsetopt octalzeroes
unsetopt typesetsilent
unsetopt verbose
unsetopt xtrace
# 10 -> shell emulation:
unsetopt bashrematch
  setopt bsdecho
unsetopt cshjunkiehistory
  setopt cshjunkieloops
unsetopt cshjunkiequotes
unsetopt cshnullcmd
unsetopt ksharrays
unsetopt kshautoload
  setopt kshoptionprint
unsetopt kshtypeset
unsetopt kshzerosubscript
unsetopt posixaliases
unsetopt posixbuiltins
unsetopt posixidentifiers
unsetopt shfileexpansion
unsetopt shnullcmd
unsetopt shoptionletters
unsetopt shwordsplit
unsetopt trapsasync
# 11 -> shell state:
#  setopt interactive # do not set!
#  setopt login       # do not set!
#unsetopt privileged  # do not set!
#unsetopt restricted  # do not set!
#  setopt shinstdin   # do not set!
unsetopt singlecommand
# 12 -> zle:
unsetopt beep
unsetopt combiningchars
unsetopt emacs
unsetopt overstrike
unsetopt singlelinezle
  setopt vi
  setopt zle
