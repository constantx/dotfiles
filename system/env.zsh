umask 022


export EDITOR='subl -w'
export NODE_ENV=development

function cdl { cd $1; ls;}

# {{{
# Node Completion - Auto-generated, do not touch.
# shopt -s progcomp
# for f in $(command ls ~/.node-completion); do
#  f="$HOME/.node-completion/$f"
#  test -f "$f" && . "$f"
# done
# }}}



# source nvm
source ~/.nvm/nvm.sh
