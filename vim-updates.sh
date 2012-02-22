#!/bin/sh

for i in ~/dotfiles/.vim/bundle/*; do
	echo $i
	if [ -f "$i/.git" ]; then
		cd $i
		git fetch origin
		git log origin/master... --oneline
	fi
done
