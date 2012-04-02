#!/bin/bash
thepath="$1"
word="$2"
function search () {
if [ -d "$1" ];then
	for things in "$1"/*
	do
		if [ -d "$things" ];then
			search "$things"
		elif [ -f "$things" ];then
			# check if its text file
			textresult=$( file "$things" | grep text )
			if [ -n "$textresult" ];then
				#Search for match of the word
				match=$( cat "$things" | grep "$word" -i )
				if [ -n "$match" ];then
					echo "File: $things"
				fi
			fi
		fi
	done
elif [ "$1" = "--help" ];then
	echo "Usage: search [target-directory] [word-signature]"
	echo
	echo "List all text files in the target directory whose contents"
	echo "contains one or more of the \"word-signature\" "
	echo "note: word-signature is a single word."
	echo "It's a simple tool but useful"
	echo ""
	echo "Report bugs or areas of improvement to <john.f.mukulu@gmail.com>"
	echo "Writer: John F. Mukulu <john.f.mukulu@gmail.com>"
	echo "Ingenuity Uprising"
fi
}

search "$thepath"
