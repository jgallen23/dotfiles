
#if [ -f ~/.bashrc ]; then
	#. ~/.bashrc
#fi
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
if [ -f ~/.bash_env ]; then
	. ~/.bash_env
fi

source ~/dotfiles/git-completion.bash
source ~/dotfiles/git-extras/etc/bash_completion.sh

if [ -f /usr/local/bin/grunt ]; then
  eval "$(grunt --completion=bash)"
fi

export PATH=~/bin:~/dotfiles/git-extras/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH
export PYTHONPATH=/System/Library/Frameworks/Python.framework/Versions/2.6/Extras/lib/python:/Library/Python/2.6/site-packages:$PYTHONPATH
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=vim
CDPATH=$CDPATH:~:$HOME/code
shopt -s cdspell

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

PS1='[\u@$(hostname)] \[${c_green}\]\w\[${c_sgr0}\]\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]: '

export HISTCONTROL=ignoredups:erasedups
HISTFILESIZE=1000000000 HISTSIZE=1000000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

#. ~/dotfiles/bin/z/z.sh
#export TERM=screen-256color

#if ssh and not in tmux, run tmux
if [ -n $SSH_TTY ] && [ -z $TMUX ] && [ -f /usr/bin/tmux ]; then
  tm
fi

#source ~/dotfiles/powerline/powerline/bindings/bash/powerline.sh
