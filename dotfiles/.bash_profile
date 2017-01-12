# setting behavior of history
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=""
export HISTSIZE=""
export HISTIGNORE='&:l:l[als]:[bf]g:history:exit'

# store command with multiple lines
export command_oriented_history=1

# shell options for history
shopt -s globstar autocd cmdhist histappend histreedit histverify

[ -s "~/.bash_variables" ]  && . ~/.bash_variables
[ -s "~/.bash_secrets" ]    && . ~/.bash_secrets
[ -s "~/.bash_path" ]       && . ~/.bash_path
[ -s "~/.bash_functions" ]  && . ~/.bash_functions
[ -s "~/.bash_aliases" ]    && . ~/.bash_aliases
[ -s "~/.bash_prompt" ]     && . ~/.bash_prompt
[ -s "~/.bash_inits" ]      && . ~/.bash_inits
