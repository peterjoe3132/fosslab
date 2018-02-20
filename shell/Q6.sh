#!/bin/bash
clear
echo "CALCULATOR"
echo "enter first operand:"
read a
echo "enter second operand:"
read b
check=0
while [ $check -eq 0 ]
do 
echo "enter :"
echo "1.addition "
echo "2.subtraction"
echo "3.multiplication"
echo "4.division"
echo "5.modulus"
echo "6.exit"
read c
if [ "$c" -eq "1" ];then
d=$((a +b ))
echo "$d"
elif [ "$c" -eq "2" ];then
d=$((a -b ))
echo "$d"
elif [ "$c" -eq "3" ];then
d=$((a *b ))
echo "$d"
elif [ "$c" -eq "4" ];then
d=$((a /b ))
echo "$d"
elif [ "$c" -eq "5" ];then
d=$((a %b ))
echo "$d"
elif [ "$c" -eq "6" ];then
check=1
fi
done


