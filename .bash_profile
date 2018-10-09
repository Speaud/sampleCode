##
export PATH="/usr/local/opt/node@8/bin:$PATH"
export HSCONFIG="/Users/joshuamummert/Webapps/.hsconfig"

##
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

gitacp() {
 git add . && git commit -m "$1" && git push
}

gitnb() {
 git checkout -b $1
 git push -u origin $1
}

alias webapps="cd /Users/joshuamummert/Webapps"
alias cls="clear"
alias ll="ls -l"
alias lla="ls -la"
alias startup="open /Applications/Firefox.app && open /Applications/Slack.app"
alias rspa="cd .. && make bld && cd build/ && node start"

## term mods
#export PS1='\w: '
#export PS1='\w \[\033[32m\]\$(parse_git_branch)\[\033[00m\]: "
#export PS1='\w '
export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
