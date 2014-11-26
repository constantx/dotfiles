umask 022


# Only set this if we haven't set $EDITOR up somewhere else previously.
if [[ "$EDITOR" == "" ]] ; then
  # Use sublime for my editor.
  export EDITOR='subl'
fi

if [[ "$NODE_ENV" == "" ]] ; then
  export NODE_ENV='development'
  export PORT=5000
fi

if [[ "$RAILS_ENV" == "" ]] ; then
  export RAILS_ENV='development'
fi

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

source ~/.bash_profile > /dev/null
