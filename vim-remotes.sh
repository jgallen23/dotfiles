#!/bin/sh

for i in ~/dotfiles/.vim/bundle/*; do
	if [ -d "$i/.git" ] || [ -f "$i/.git" ]; then
		echo $i
		cd $i
    git remote -v
	fi
done
