#!/bin/bash
echo " CALCULATOR "
echo "enter a and b "
read a b 
check=1
while [ $check -eq 1 ]
 do 
 echo " 1.addition"
 echo " 2.subtraction"
 echo " 3.multiplication "
 echo " 4.division "
 echo " 5.modulus"
 echo " 6.exit"
 read c
 case $c in
   1) d=$((a +b ))
      echo " $d ";;
   2) d=$((a -b ))
      echo " $d ";;
   3) d=$((a *b))
      echo " $d ";;
   4) d=$((a /b))
	echo " $d ";;
   5) d=$((a %b))
	echo " $d ";;
   6) check=0;;
   *) echo "invalid input ";;
 esac
 done 
		
