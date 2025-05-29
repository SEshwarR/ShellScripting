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

if [ $? -ne 0 ]  # $? checks the exit status of the code
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