#!/bin/sh

# Copy a folder to a new destination, without using cp -r command.

if [ $# -eq 2 ] 
then
	files=`cd $1; find .`

	if [ -d $2 ]
	then
		rm -r $2
	fi

	mkdir $2

	for file in $files
	do
		if [ "$file" != "." ]
		then
			if [ -d $1/$file ]
			then
				mkdir $2/$file
			else
				cp $1/$file $2/$file
			fi
		fi
	done

	exit 0
else
	echo Syntax: $0 source destination
	exit 1
fi
