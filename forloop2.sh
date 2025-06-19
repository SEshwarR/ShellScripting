#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("python" "nginx" "MySql" "httpd")

mkdir -p $LOGS_FOLDER

echo "script started executing at: $(date)" | tee -a $LOG_FILE

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: please run with root user" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G SUCCESS: You are root user" | tee -a $LOG_FILE
fi  


#validation function used to find whether the given arguments are correctly installed or not
VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo -e " $G SUCCES: Installing $2 is ..... Success" | tee -a $LOG_FILE
    else
        echo -e " $R ERROR: Installing $2 is ... Failure" | tee -a $LOG_FILE
        exit 1
    fi        
}

#for package in ${PACKAGES[@]}
for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo "$package is not installed .. going to install" | tee -a $LOG_FILE
        dnf install $package -y | tee -a $LOG_FILE
        VALIDATE $? "$package" # $? and MySQL are arguments for VALIDATE Function and considers as $1 and $2
    else
        echo -e " $Y $package is already installed"  | tee -a $LOG_FILE
    fi
done    