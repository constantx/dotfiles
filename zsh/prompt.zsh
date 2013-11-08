autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ "$st" =~ ^nothing ]]
    then
      echo "%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rb_prompt(){
  if (( $+commands[rbenv] ))
  then
    version=$(rbenv version-name 2> /dev/null)
    if [[ "$version" == "" ]] then version="-" fi

    echo "%{$fg_bold[yellow]%}$version%{$reset_color%}"
  else
    echo ""
  fi
}

directory_name(){
  echo "%{$fg_bold[cyan]%}%5/%\/%{$reset_color%}"
}

export PROMPT=$'\n$(rb_prompt) in $(directory_name) \n ☯ $(git_dirty)$(need_push)❯ '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}


###########################################
#   iTerm Tab and Title Customization     #
###########################################

function set_title_tab {

    function settab   {

        # file settab  -- invoked only if iTerm or Konsole is running

        #  Set iterm window tab to current directory and penultimate directory if the
        #  shell process is running.  Truncate to leave the rightmost $rlength characters.
        #
        #  Use with functions settitle (to set iterm title bar to current directory)
        #  and chpwd


    if [[ $TERM_PROGRAM == iTerm.app && -z "$KONSOLE_DCOP_SESSION" ]];then

      # The $rlength variable prints only the 20 rightmost characters. Otherwise iTerm truncates
      # what appears in the tab from the left.


        # Chage the following to change the string that actually appears in the tab:

          tab_label="$PWD:h:t/$PWD:t"

          rlength="10"   # number of characters to appear before truncation from the left

                echo -ne "\e]1;${(l:rlength:)tab_label}\a"


    else

        # For KDE konsole tabs

        # Chage the following to change the string that actually appears in the tab:

          tab_label="$PWD:h:t/$PWD:t"

          rlength="20"   # number of characters to appear before truncation from the left

            # If we have a functioning KDE console, set the tab in the same way
            if [[ -n "$KONSOLE_DCOP_SESSION" && ( -x $(which dcop)  )  ]];then
                    dcop "$KONSOLE_DCOP_SESSION" renameSession "${(l:rlength:)tab_label}"
            else
                : # do nothing if tabs don't exist
            fi

    fi
  }

    function settitle   {
    # Function "settitle"  --  set the title of the iterm title bar. use with chpwd and settab

    # Change the following string to change what appears in the Title Bar label:


      title_lab=$HOST:r:r::$PWD
        # Prints the host name, two colons, absolute path for current directory

      # Change the title bar label dynamically:

      echo -ne "\e]2;[zsh]   $title_lab\a"
  }

  # Set tab and title bar dynamically using above-defined functions

    function title_tab_chpwd { settab ; settitle }

    # Now we need to run it:
      title_tab_chpwd

  # Set tab or title bar label transiently to the currently running command

  if [[ "$TERM_PROGRAM" == "iTerm.app" ]];then
    function title_tab_preexec {  echo -ne "\e]1; $(history $HISTCMD | cut -b7- ) \a"  }
    function title_tab_precmd  { settab }
  else
    function title_tab_preexec {  echo -ne "\e]2; $(history $HISTCMD | cut -b7- ) \a"  }
    function title_tab_precmd  { settitle }
  fi


  typeset -ga preexec_functions
  preexec_functions+=title_tab_preexec

  typeset -ga precmd_functions
  precmd_functions+=title_tab_precmd

  typeset -ga chpwd_functions
  chpwd_functions+=title_tab_chpwd

}

####################

set_title_tab
