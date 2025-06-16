#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run the command with sudo access"
    exit 1
else
    echo " You have sudo access"
fi

dnf list installed mysql 
#checks already installed or not. if $? is 0 , then
# if not installed $? is not 0 , expression is true
if [ $? -ne 0 ]  # $? checks the exit status of the command "dnf list installed mysql"
then 
    echo "MYSQL is not installed going to install"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo " installing MYSQL is success"
    else
        echo "installing MYSQL is failure"
        exit 1
    fi    
else
    echo "MYSQL is already installed"
fi            