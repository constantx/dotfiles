# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
# alias gl='git pull --prune'
alias gb='git branch'
alias gdc='git diff --cached'
alias gdtc='git difftool --cached'
alias gbl='git branch -l'
alias gbm='git branch --merged'
alias gc='git commit'
alias gca='git commit -a'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias go='git checkout'
alias god='git checkout develop'
alias gp='git push origin HEAD'
alias gpoh='git push origin head'
alias gpr='git pull --rebase'
alias grb="git ls-remote --heads origin"
alias grso='git remote show origin'
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
           perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
# add `git catchup` and `git ribbon` from
# http://gitready.com/advanced/2011/10/21/ribbon-and-catchup-reading-new-commits.html
alias ribbon='git tag --force _ribbon origin/master'
alias catchup='gl --patch --topo-order _ribbon..origin/master'
alias quickcatchup='gl --topo-order _ribbon..origin/master'
