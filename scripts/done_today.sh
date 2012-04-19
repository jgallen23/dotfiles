#!/bin/sh

TODAY=`date +%Y-%m-%d`
TASKS=~/Dropbox/Notes/personal.taskpaper


echo "Completed Today:"
echo "----------------"
if [ -z $1 ]; then
	grep "@done($TODAY)" $TASKS | tr -d '\011' | sed -e "s/@project(\(.*\))/[\1]/" | sed -e "s/@.*[@|\[]/[/g"
else
	grep "@done($TODAY)" $TASKS | grep -i "@project($1" | tr -d '\011' | sed -e "s/@project(\(.*\))/[\1]/" | sed -e "s/@.*[@|\[]/[/g"
fi


