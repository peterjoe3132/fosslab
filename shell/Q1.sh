#!/bin/bash

echo "hello world"
a=$(logname)
echo "current login: $LOGNAME"
echo "current shell :$SHELL"
echo "home directory :$HOME"
a=$(arch)
echo  "architecture :$a"
echo "current path : $PATH"
echo "pwd :$PWD"
echo "logged in users : $USER"
