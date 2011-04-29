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
dj() { ./manage.py $@ --settings $DJANGO_SETTINGS_FILE; }
alias of="open ."
alias u='cd ..'
alias u2='cd ../..'

gitcheck() {
	for i in ~/code/*; do
		(cd $i && (echo $i; git status -s))
	done
}

alias chromedev="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security"
