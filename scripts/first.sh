#!/bin/bash

#this is how you add comments in linux shell script
#there is no way to add multiline comment in shell script
# we can only add single line comments in shell script

# which bash will give the location of where the bash is located

sleep 1
# to display you use echo command
echo "hello world Don't forget to be awesome"

# what are the variables
# two types of variables System and userdefined variables
# system variables are usually defined capital by convention
echo $BASH
echo $BASH_VERSION
echo $HOME
echo $PWD

#For user defined variables
name=Mark
echo The name is $name
#the variable name should not be start as number
# how to take input from user
echo "Enter name: "
read name
echo "Entered name : $name"

