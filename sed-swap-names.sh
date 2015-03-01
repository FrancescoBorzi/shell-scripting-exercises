#!/bin/bash

if [ $# -eq 2 ]
then
    cat $1 | sed -r 's/([A-Za-z]+) ([A-Za-z]+)/\2 \1/' > $2
else
    echo Syntax: $0 input.txt output.txt
fi
