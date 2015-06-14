source ~/dotfiles/git-completion.bash
source ~/dotfiles/vendor/git-extras/etc/bash_completion.sh

source ~/dotfiles/bash/completion/docker

if [ -f /usr/local/bin/grunt ]; then
  eval "$(grunt --completion=bash)"
fi

complete -C '/usr/local/bin/aws_completer' aws

