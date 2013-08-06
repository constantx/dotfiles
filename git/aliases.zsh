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
alias gbl='git branch -l'
alias gpoh='git push origin head'
alias grso='git remote show origin'
alias gc='git commit'
alias gca='git commit -a'
alias go='git checkout'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gpr='git pull --rebase'
alias grb="git ls-remote --heads origin"
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
# add `git catchup` and `git ribbon` from
# http://gitready.com/advanced/2011/10/21/ribbon-and-catchup-reading-new-commits.html
alias ribbon='git tag --force _ribbon origin/master'
alias catchup='git log --patch --reverse --topo-order _ribbon..origin/master'
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
           perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"