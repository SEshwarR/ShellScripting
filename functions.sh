#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo " please run with root user"
    exit 1
else
    echo "You are root user"
fi  


#validation function used to find whether the given arguments are correctly installed or not
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
    VALIDATE $? "MySQL" # $? and MySQL are arguments for VALIDATE Function and considers as $1 and $2
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