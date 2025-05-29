#!/bin/bash

echo " All variables passed to the script: $@"
echo " no of variables: $#"
echo " Script name: $0"
echo "current directory : $PWD"
echo " user running the script : $USER"
echo " Home directory of the user: $HOME"
echo " PID of the script: $$"
sleep 10 &
echo " Pid of the background process: $!"