#!/bin/sh

# A tool to search files by extension

if [ $# = 2 ]
then
	find $1 | grep "\.$2$"
else
	echo
	echo Syntax: $0 \"path\" \"extension\"
	echo
	echo Example: $0 \"/home/user/sources\" \"java\"
	echo
fi
