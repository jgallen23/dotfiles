HISTFILESIZE=1000000000 HISTSIZE=1000000
set HOSTNAME=`hostname`
alias v='ls -lah'
alias lv='ls -lah'
alias scpr="rsync --partial --progress --rsh=ssh"

alias grephist='history | grep'
alias grepps='ps aux | grep'

sshkey() { cat ~/.ssh/id_rsa.pub | ssh $@ 'cat >> .ssh/authorized_keys'; }

alias free="free -m"
alias s="screen -dR"
function t {
	if [ -z "$1" ];then
		tmux ls
	else
		tmux at -t $1 || tmux new -s $1
	fi
}
dj() { ./manage.py $@ --settings $DJANGO_SETTINGS_FILE; }
alias of="open ."
alias u='cd ..'
alias u2='cd ../..'
alias bp='~/code/boilerplate/bp'

gitcheck() {
	for i in ~/code/*; do
		(cd $i && (echo $i; git status -s))
	done
}

alias chromedev="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security"
alias timemachine="/System/Library/CoreServices/backupd.bundle/Contents/Resources/backupd-helper &"

function swap_priority {
	find . -type f | xargs sed -i '' -e "s/ ] ($1)/ ] ($2)/"
}
complete -W "$(echo $(grep '^ssh ' .bash_history | sort -u | sed 's/^ssh //'))" ssh
