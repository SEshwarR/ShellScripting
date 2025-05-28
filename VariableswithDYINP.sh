#!/bin/bash

echo "enter user username:" 
read username  #takes the input from user while running the program
echo "enter password:"
read -s password # takes the input from user but you cant see the input you entered
echo "$password"