# setting behavior of history
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=""
export HISTSIZE=""
export HISTIGNORE='&:l:l[als]:[bf]g:history:exit'

# store command with multiple lines
export command_oriented_history=1

# shell options for history
shopt -s globstar autocd cmdhist histappend histreedit histverify

# Utils Aliases
alias y2j="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF.read))'"
alias j2y="ruby -ryaml -rjson -e 'puts JSON.parse(ARGF.read).to_yaml'"
alias x2j="ruby -rjson -r'active_support/all' -e 'puts Hash.from_xml(ARGF.read).to_json'"
alias h2j="ruby -ryaml -rjson -e 'load \"data_files/wines_data.rb\"; puts @wines_data.to_json'"

# Aliases for moving around
alias ..="cd .."
alias 2..="cd ../.."
alias 3..="cd ../../.."
alias 4..="cd ../../../.."
alias cd-='cd /Users/warantesbr/Projects'
alias cd--='cd /Users/warantesbr/workspace'
alias cd-ab='cd /Users/warantesbr/Projects/agilebrazil/agile-brazil-2015-hotsite/'
alias cd-bkf='cd /Users/warantesbr/workspace/bankfacil'
alias cd-bkfc='cd /Users/warantesbr/workspace/bankfacil/core'
alias cd-md='cd /Users/warantesbr/Projects/medicinia/Medicinia'
alias cd-mds='cd /Users/warantesbr/Projects/medicinia/Medicinia-Server-Scripts'
alias cd-my='cd /Users/warantesbr/Projects/_mine'
alias cd-rep='cd /Users/warantesbr/Projects/repassa/repassa-spree-new'
alias cd-fle='cd /Users/warantesbr/Projects/soundy/flemings/flemings-frontend/flemings-website'

# Aliases for listing
alias ls="ls -Gp"
alias la="ls -lA"
alias l='ls -lF'
alias ll='ls -alhF'

# Aliases for editing basic files
alias eprof="emacs ~/.bash_profile"
alias espcm="emacs ~/.spacemacs"
alias esconf="emacs ~/.ssh/config"

# Aliases for redefining commands or create new one's
alias psf="ps -cU `whoami`"
alias grep="grep --color=auto"
alias rback="ack --rb"
alias aack="ack --all"
alias pwdc="pwd | pbcopy"

#alias wrangler='open -a ~/Applications/TextWrangler.app/'
alias v='vim'
alias mate=subl
alias git=hub
alias gci='git commit'
alias gcia='git cia'
alias gck='git checkout'
alias gfa='git fetch --all'
alias gcd='git checkout develop'
alias gcm='git checkout master'
alias gpo='git push origin'
alias gpod='git push origin develop'
alias gpom='git push origin master'
alias glo='git pull origin'
alias glod='git pull origin develop'
alias glom='git pull origin master'
alias glodm='for branch in {master,develop}; do git checkout $branch && git pull origin $branch; done'
alias glomd=glodm
alias gp='git push'
alias gpt='git push --tags'
alias gst='git status'

# source $(brew --prefix)/etc/grc.bashrc

# Vagrant Aliases
alias vup="vagrant up"
alias vp="vagrant provision"
alias vh="vagrant halt"
alias vd="vagrant destroy"
alias vs="vagrant suspend"
alias vr="vagrant resume"
alias vrld="vagrant reload"
alias vssh="vagrant ssh"
alias vstat="vagrant status"

# Vagrant Box Aliases
alias vbl="vagrant box list"
alias vba="vagrant box add"
alias vbr="vagrant box remove"
alias vbrp="vagrant box repackage"

# functions
function searchText(){
	if [ -z $2 ]; then
        opt='-sli'
    else
        opt=$2
	fi

	if [ -z $1 ]; then
        #echo "usage: $FUNCNAME <text-to-search-for> [grep_options] [find_options]"
        echo "usage: $FUNCNAME <text-to-search-for> [grep_options]"
    else
		find . -path '*.svn/*' -prune -o -type f \( -name "*.as" -o -name "*.asax" -o -name "*.ashx" -o -name "*.asp" -o -name "*.aspx" -o -name "*.config" -o -name "*.cs" -o -name "*.css" -o -name "*.db" -o -name "*.htm" -o -name "*.html" -o -name "*.js" -o -name "*.php" -o -name "*.php3" -o -name "*.sql" -o -name "*.txt" -o -name "*.xml" \) -print0 | xargs -0 grep -l $1 $opt
	fi
}

function searchTextInAllFiles(){
	if [ -z $2 ]; then
        opt='-sli'
    else
        opt=$2
	fi

	if [ -z $1 ]; then
        #echo "usage: $FUNCNAME <text-to-search-for> [grep_options] [find_options]"
        echo "usage: $FUNCNAME <text-to-search-for> [grep_options]"
    else
		find . -path '*.svn/*' -prune -o -type f -print0 | xargs -0 grep -l $1 $opt
	fi
}

function showInvisible(){
	defaults write com.apple.finder AppleShowAllFiles TRUE  
	killall Finder
}

function hideInvisible(){
	defaults write com.apple.finder AppleShowAllFiles FALSE
	killall Finder
}

function flashtrace(){
   tail -f ~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt
}

function checkout(){
	if [ -z $1 ]; then
        echo "usage: $FUNCNAME [project-name]"
    else
		svn checkout https://200.189.219.203/svn/$1
	fi
}

function fordCheckout(){
	if [ -z $1 ]; then
        echo "usage: $FUNCNAME [project-name]"
    else
		svn checkout https://200.189.219.203/svn/Ford/$1
	fi
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}

function parse_svn_branch() {
	parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "" $2 ")"}'
}

function parse_svn_url() {
	svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}

function parse_svn_repository_root() {
	svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local       RESET="\[\033[0m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\hw\007\]'
    ;; 
    *) 
    TITLEBAR=""
    ;; 
  esac

  # svn info | grep '^URL:' | egrep -o '(tags|branches)/[^/]+|trunk' | egrep -o '[^/]+$'

  # export PS1="\h $GREEN\W$RESET\$ "
  PS1="\! ${TITLEBAR}$RED\w $GREEN\$(parse_git_branch)$WHITE\n\$ "
  PS2='> '
  PS4='+ '
}

function cleansvnfiles(){
	find . -name ".svn" -exec rm -rf {} \;
}

function cleanmacfiles(){
  find . -name ".DS_Store" -exec rm -rf {} \;
}

proml

export EDITOR='mvim -v'
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
# export EDITOR='emacs'
# export EDITOR='subl -w'

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
# export LSCOLORS=ExFxCxDxBxegedabagacad;;

export PATH="$HOME/.rvm/bin:$HOME/Library/Scripts:$PATH"
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/mongodb/bin:$PATH"
export PATH="$PATH:/Users/warantesbr/Library/Python/2.7/bin"

# Initializing z.sh
# . `brew --prefix`/etc/profile.d/z.sh

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export NVM_DIR="/Users/warantesbr/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex" # This loads Kiex into a shell session.
[[ -s "$HOME/bin/erlang/r19.1b/activate" ]] && source "$HOME/bin/erlang/r19.1b/activate" # This activates Erlang 19.0 into a shell session.

export ANSIBLE_NOCOWS=1
export VM_MEM_SIZE="1280"

clear
source /Users/warantesbr/.rack/bash_autocomplete

# Default AWS Profile
# export AWS_DEFAULT_REGION="us-west-2"
# export AWS_DEFAULT_PROFILE="bankfacil"

# Docker Initialization
DOCKER_DEV_VM="default-docker"
DOCKER_MACHINE="/usr/local/bin/docker-machine"

# if [[ "$($DOCKER_MACHINE status $DOCKER_DEV_VM)" == "Running" ]]; then
#   eval "$($DOCKER_MACHINE env $DOCKER_DEV_VM)"
# fi

# path to the DCOS CLI binary
# if [[ "$PATH" != *"/Users/warantesbr/dcos/bin"* ]];
#   then export PATH=$PATH:/Users/warantesbr/dcos/bin;
# fi

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
