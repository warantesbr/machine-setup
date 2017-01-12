# setting behavior of history
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=""
export HISTSIZE=""
export HISTIGNORE='&:l:l[als]:[bf]g:history:exit'

# store command with multiple lines
export command_oriented_history=1

# shell options for history
shopt -s globstar autocd cmdhist histappend histreedit histverify

[[ -s "$HOME/.bash_variables" ]]  && . "$HOME/.bash_variables"
[[ -s "$HOME/.bash_secrets" ]]    && . "$HOME/.bash_secrets"
[[ -s "$HOME/.bash_path" ]]       && . "$HOME/.bash_path"
[[ -s "$HOME/.bash_functions" ]]  && . "$HOME/.bash_functions"
[[ -s "$HOME/.bash_aliases" ]]    && . "$HOME/.bash_aliases"
[[ -s "$HOME/.bash_prompt" ]]     && . "$HOME/.bash_prompt"
[[ -s "$HOME/.bash_inits" ]]      && . "$HOME/.bash_inits"
