source ~/dotfiles/bash/completion/git.bash

source ~/dotfiles/bash/completion/docker

if [ -f /usr/local/bin/grunt ]; then
  eval "$(grunt --completion=bash)"
fi

if [[ -f /usr/local/bin/aws_completer ]]; then
  complete -C '/usr/local/bin/aws_completer' aws
fi

#complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh
