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
alias tm='t main'
alias ta='t all'
alias of="open ."
alias u='cd ..'
alias u2='cd ../..'

gitcheck() {
	for i in ~/code/*; do
		(cd $i && (echo $i; git status -s))
	done
}

alias chromedev="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security"
alias timemachine="/System/Library/CoreServices/backupd.bundle/Contents/Resources/backupd-helper &"

complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh

cdf() {
	DIR=`find . -type d | grep -m 1 $1`
	pushd $DIR
}

github() {
	git clone git@github.com:/jgallen23/$1.git
}

ss() {
  ssh gregamel@gregamel.local "/usr/local/bin/phantomjs ~/Dropbox/Scripts/render.js $1 ~/Dropbox/ScreenShots/ss.png"
}

tab() {
  PWD=`pwd`
  DIR=`basename $PWD`
  echo -ne "\033]0;$DIR\007"
}
f(){ if [ "$PWD" != "$LPWD" ];then LPWD="$PWD"; tab; fi }; 
#export PROMPT_COMMAND=f;

update-time() {
  sudo ntpdate pool.ntp.org
}

gi() {
  if [ $# -eq 1 ]; then
    npm i -D grunt-$*
  else
    local IFS=,;
    eval npm i -D grunt-{"$*"};
  fi
}
