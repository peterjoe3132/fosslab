#!/bin/bash
#to display the even lines in a text file 

awk 'NR % 2 == 0' textfile.txt

