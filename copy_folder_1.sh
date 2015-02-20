#!/bin/sh

# Copy a folder to a new destination, without using cp -r command.

# Enhancement 1: 
# check if the dest dir is not empty in this case do not perform the copy unless option "-w" is specified			

if [ "$1" == "-w" ]
then
	w="on"
	shift
else
	w="off"
fi	

if [ $# -eq 2 ]
then
	if [ ! -d $1 ]
	then
		echo Directory $1 doesn\'t exists
		exit 0
	fi
	
	if [ ! -d $2  ]
	then
		mkdir $2
	fi

	files=`cd $1; find .`

	for file in $files
	do
		if [ "$file" != "." ]
		then
			if [ -d $1/$file ]
			then
				if [  -d $2/$file  ]
				then
					n_files=`find $2/$file | wc -l`

					if [ $w == "on" ] || [ $n_files -eq 1 ]
					then
						rm -r $2/$file
						mkdir $2/$file
					else
						echo Directory $2/$file is not empty. Use -w to delete it and replace with $1
					fi
				else
					mkdir $2/$file
				fi
			else
				cp $1/$file $2/$file
			fi
		fi
	done

	exit 0
else
	echo Syntax: $0 [-w] source destination
	exit 1
fi
