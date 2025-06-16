#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo " please run with root user"
    exit 1
else
    echo "You are root user"
fi  

VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo "Installing $2 is ..... Success"
    else
        echo " Installing $2 is ... Failure"
        exit 1
    fi        
}

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "MySQL is not installed .. going to install"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "  MySQL is already installed"  
fi

dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "nginx is not installed .. going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "  nginx is already installed" 
fi