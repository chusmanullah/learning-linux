#!/bin/bash
# this script is made 
# to take multiple arguments e.g
# file-name size date extension 
# and shows the result based on those
# arguments
#This  program is made to print file details
# program consists of following parameters
# usage_help ()
# first_func ()
# print_func ()
# print_raw_func ()
# print tree func ()
# filter_by_size ()
# filter_by_date ()
# filter_by_extension ()

#color variables


#color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033(0; 33m'
blue='\033 [0;34m'
magenta='\033[0; 35m'
cyan='\033 [0;36m'

# clear the color after that with
color-erase='\033[0m'

#DEFAULT VALUES

unset DIRECTORY_PATH
unset FILTER_EXTENSION
unset FILTER_DATE
unset FILTER_SIZE
unset FILE_PATH

DIRECTORY_PATH=""
FILTER_EXTENSION=""
FILTER_DATE=""
FILTER_SIZE=""
FILE_PATH=""

# prints the help message on screen
