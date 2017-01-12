function cleanmacfiles(){
  find . -name ".DS_Store" -exec rm -rf {} \;
}

function cleansvnfiles(){
  find . -name ".svn" -exec rm -rf {} \;
}

function showInvisible(){
  defaults write com.apple.finder AppleShowAllFiles TRUE  
  killall Finder
}

function hideInvisible(){
  defaults write com.apple.finder AppleShowAllFiles FALSE
  killall Finder
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

# DEPRECATED FUNCTIONS

# function flashtrace(){
#   tail -f ~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt
# }

# function checkout(){
#   if [ -z $1 ]; then
#     echo "usage: $FUNCNAME [project-name]"
#   else
#     svn checkout https://200.189.219.203/svn/$1
#   fi
# }

# function fordCheckout(){
#   if [ -z $1 ]; then
#     echo "usage: $FUNCNAME [project-name]"
#   else
#     svn checkout https://200.189.219.203/svn/Ford/$1
#   fi
# }
