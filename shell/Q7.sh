#!/bin/bash
echo $#
if [ "$#" != 2 ]
then
	echo "3 parameters required $2"
else
	echo $?
	grep $1 $2
	x=$?
	echo $x
	if [ $x = 1 ] 
	then
		echo "user has been added"
		echo $1 >> $2
	else
		echo "user found"
	fi
fi
