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
alias v='vim'
alias psf="ps -cU `whoami`"
alias grep="grep --color=auto"
alias rback="ack --rb"
alias aack="ack --all"
alias pwdc="pwd | pbcopy"
# Converting
alias y2j="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF.read))'"
alias x2j="ruby -rjson -r'active_support/all' -e 'puts Hash.from_xml(ARGF.read).to_json'"
alias j2y="ruby -ryaml -rjson -e 'puts JSON.parse(ARGF.read).to_yaml'"
# alias mate=subl
# alias wrangler='open -a ~/Applications/TextWrangler.app/'
# alias h2j="ruby -ryaml -rjson -e 'load \"hash_file.rb\"; puts @hash.to_json'"

# Aliases for moving around
alias ..="cd .."
alias 2..="cd ../.."
alias 3..="cd ../../.."
alias 4..="cd ../../../.."
alias cd-='cd /Users/warantesbr/Projects'
alias cd-my='cd /Users/warantesbr/Projects/_mine'
# alias cd--='cd /Users/warantesbr/workspace'
# alias cd-ab='cd /Users/warantesbr/Projects/agilebrazil/agile-brazil-2015-hotsite/'
# alias cd-bkf='cd /Users/warantesbr/workspace/bankfacil'
# alias cd-bkfc='cd /Users/warantesbr/workspace/bankfacil/core'
# alias cd-md='cd /Users/warantesbr/Projects/medicinia/Medicinia'
# alias cd-mds='cd /Users/warantesbr/Projects/medicinia/Medicinia-Server-Scripts'
# alias cd-rep='cd /Users/warantesbr/Projects/repassa/repassa-spree-new'
# alias cd-fle='cd /Users/warantesbr/Projects/soundy/flemings/flemings-frontend/flemings-website'

# Aliases for git commands
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

# TODO => Review
# source $(brew --prefix)/etc/grc.bashrc

# Aliases for Vagrant
alias vup="vagrant up"
alias vp="vagrant provision"
alias vh="vagrant halt"
alias vd="vagrant destroy"
alias vs="vagrant suspend"
alias vr="vagrant resume"
alias vrld="vagrant reload"
alias vssh="vagrant ssh"
alias vstat="vagrant status"
# Vagrant Box
alias vbl="vagrant box list"
alias vba="vagrant box add"
alias vbr="vagrant box remove"
alias vbrp="vagrant box repackage"
