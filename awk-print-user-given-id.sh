#!/bin/bash
if [ $# -eq 1 ]
then
	cat ~/passwd.txt | awk \
	'
	BEGIN { FS=":"; }
	{ 
		if ('$1' == $3)
			print $1;

	}
	'
else
	echo Syntax: $0 user_id
fi


