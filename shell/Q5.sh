#!/bin/bash

a=$(lsb_release -a)
echo "OS details: $a"
echo "aailable shells :"
echp $(cat /erc/shells)
echo "mouse settings:"
echo $(xinput --list --short)
echo "CPU information"
echo $(lscpu)
echo "memory information :"
echo $(free -m)
echo "file systems"
echo $(sudo fdisk -1)
