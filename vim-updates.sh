#!/bin/sh

for i in ~/dotfiles/.vim/bundle/*; do
	if [ -d "$i/.git" ] || [ -f "$i/.git" ]; then
		echo $i
		cd $i
		git fetch -q origin
		git log origin/master... --oneline | wc -l
	fi
done
