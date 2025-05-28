#!/bin/bash
echo "enter number1:" #prompts user to enter number1
read Number1   #takes input from user and store it in variable "Number1"
echo "enter number2:"  #prompts user to enter Number2
read Number2    #takes input from user and store it in Number2
TIMESTAMP=$(date) 
echo "Script executed at: $TIMESTAMP"
SUM=$(($Number1+$Number2))

echo "SUM of $Number1 and $Number2 is: $SUM"