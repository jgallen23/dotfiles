alias screen='export SCREENPWD=$(pwd); screen'
#export SHELL='/bin/bash -rcfile ~/.bash_profile';

case "$TERM" in 
    'screen')
     cd $SCREENPWD
      ;; 
esac

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
if [ -f ~/.bash_env ]; then
	. ~/.bash_env
fi

source ~/dotfiles/git-completion.bash

export PATH=~/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PYTHONPATH=/System/Library/Frameworks/Python.framework/Versions/2.6/Extras/lib/python:/Library/Python/2.6/site-packages:$PYTHONPATH
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=vim

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
          return 0
  fi
  echo -e " [$gitver]"
}

branch_color ()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then
                color=""
                if git diff --quiet 2>/dev/null >&2 
                then
                        color="${c_green}"
                else
                        color=${c_red}
                fi
        else
                return 0
        fi
        echo -ne $color
}

PS1='[\u] \[${c_green}\]\w\[${c_sgr0}\]\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]: '

# Set the screen title
case $TERM in
	screen*)
		# This is the escape sequence ESC k \w ESC \
		#Use path as titel
		#SCREENTITLE='\[\ek\w\e\\\]'
		#Use program name as titel
		SCREENTITLE='\[\ek\e\\\]'
		;;
	*)
		SCREENTITLE=''
		;;
esac


PS1="${SCREENTITLE}${PS1}"


bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

. ~/dotfiles/bin/z/z.sh
