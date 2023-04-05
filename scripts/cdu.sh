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
color_erase='\033[0m'

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
usage_help () {
  echo ""
  echo ""
  echo " Usage: $0 <directory-path> [-h -e -d"
  echo "NAME"
  echo "      cdu.sh - custom disk usage        "
  echo "SYNOPSIS"
  echo "          bash cdu.sh [FILE] [OPTION]     "
  echo " calculates individual and total size of files based on"
  echo " date | extension | size"
  echo " -h --help Display this help message and exit"
  echo " -e --extension <ext> Calculates and display only files with specific extension"
  echo " -s --size <###MB> e.g 30bytes | 30KB | 30MB | 30gB"
  echo "-d --date <yyyy-mm-dd> Filter Files prior to provided date"
  exit 1
  }
  #################################
  # FIRST FUNCTION #
  # this function just pipelines file to other functions #
  ###################################
  first_func () {
    local file_name=$FILE_PATH
    awk -F ",,,," '{ print $0 }' $file_name
    }

    ####################################
    # PRINT_FUNCTION
    # this function prints the data in nice format on terminal #
    #####################################

    print_func () {
      awk -F ",,,," 'BEGIN {printf("\n\n\n\n========================================\
      ==============================================================================\
      ==============================================================================\
      \n%-85s%-15s%-10s%-70s\n===================\
      ===============================================================================\
      ===============================================================================\
      ============================\n","FILE NAME","FILE SIZE", "DATE ",\
      "                     ABSOLUTE PATH TO FILE ") } { \
        if($3 < 1024 ) printf("%-50s\t%-d bytes\t", $2 ,$3 )
        elseif($3 < 1048576 ) printf("%-50s\t%20.2fKB\t", $2 ,$3/1024 )
        elseif($3 < 1073741824) printf("%-50s\t%20.2fMB\t", $2 ,$3/1048576 )
        elseif($3 < 1099511627776 ) printf("%-50s\t%20.2fGB\t", $2 ,$3/1073741824 )
        elseif($3 < 1125899906842624 ) printf("%-50s\t%20.2fTB\t", $2 ,$3/1099511627776 )
        else printf("%-50s\t%20.2fPB\t", $2 ,$3/1125899906842624 )

        print substr($4,1,11) "        " $1 
        total+=$3 END{ 
        if(total < 1024 ) printf "%d bytes\n" 
        elseif(total < 1048576 ) printf("\n\n\n Size of filtered files is %d        %.2fKB\n",total ,total/1024 )
        elseif(total < 1073741824) printf("\n\n\n Size of filtered files is %d        %.2fMB\n",total ,total/1048576 )
        elseif(total < 1099511627776 ) printf("\n\n\n Size of filtered files is %d        %.2fGB\n",total ,total/1073741824 )
        elseif(total < 1125899906842624 ) printf("\n\n\n Size of filtered files is %d        %.2fTB\n",total ,total/1099511627776 )
        else printf("\n\n\n Size of filtered files is %d        %.2fPB\n",total ,total/1125899906842624 ) }'
        echo " "
        echo " "
        echo "This function prints ouput on screen for whatever is provided"
        echo " "
        total_size_string=$( awk -F ",,,," '{
                if(total < 1024 ) printf "%d bytes\n"
                elseif(total < 1048576 ) printf("\n\n\n Size of All  files is %d        %.2fKB\n",total ,total/1024 )
                elseif(total < 1073741824) printf("\n\n\n Size of All  files is %d        %.2fMB\n",total ,total/1048576 )
                elseif(total < 1099511627776 ) printf("\n\n\n Size of All  files is %d        %.2fGB\n",total ,total/1073741824 )
                elseif(total < 1125899906842624 ) printf("\n\n\n Size of All  files is %d        %.2fTB\n",total ,total/1099511627776 )
                else printf("\n\n\n Size of All  files is %d        %.2fPB\n",total ,total/1125899906842624 ) }' $FILE_PATH )
        echo " "
        echo -e " ${green} $total_size_string ${color_erase}"
        echo " "
        echo " "
      # have to implement this for calculation of filtered files
      #  echo "$filtered_size_string"

} #EOF print_func()

print_raw_func () {
  awk -F ",,,," '{  if($3 < 1024 ) printf("%-50s\t%-d bytes\t", $2 ,$3 )
          elseif($3 < 1048576 ) printf("%-50s\t%20.2fKB\t", $2 ,$3/1024 )
          elseif($3 < 1073741824) printf("%-50s\t%20.2fMB\t", $2 ,$3/1048576 )
          elseif($3 < 1099511627776 ) printf("%-50s\t%20.2fGB\t", $2 ,$3/1073741824 )
          elseif($3 < 1125899906842624 ) printf("%-50s\t%20.2fTB\t", $2 ,$3/1099511627776 )
          else printf("%-50s\t%20.2fPB\t", $2 ,$3/1125899906842624 )

          print substr($4,1,11) "        " $1 }'

}

main_func () {
  echo "this is main function will be filled later"
}


#############################################
### FILTER BY   DATE        #################
#############################################
filter_by_date () {
  # script can take value in yyyy-mm-dd
  # takes the date from terminal provided date into mydate
  local mydate=$FILTER_DATE
  #converts the provided date into epoch seconds
  my_epoch_date=$(date -d "$mydate"+%s)

  awk -F ',,,,' -v test_date=$my_epoch_date '{ if ($5 < test_date ) {
                   print $0 }
                   }'
  }#EOF function filter_by_date()

#############################################
### FILTER BY EXTENSION     #################
#############################################
  filter_by_extension () {
    awk -F ',,,,' -v my_ext=$FILTER_EXTENSION '{if(match(tolower(substr($2,length($2)-9,10)),tolower(my_ext)))
                                               { print $0 }}'
    echo "filter_by_extension is called"
  } EOF filter_by_extension


  #############################################
  ### FILTER BY  SIZE         #################
  #############################################
filter_by_size () {
  #script can take values in BB/bb MB/mb GB/gb TB/tb
  # and print those values accoordingly
  # will take the provided size in variable given size
  local given_size=$FILTER_SIZE
  local compare_size=""
  #to get the length of given size
  given_size_length=$(echo $given_size | awk '{print length}')
  #to get last two characters of the string
  last_val=${given_size:(-2)}
  actual_val=${given_size::-2}
  last_val_lower=$(echo "$last_val" | tr '[:upper:' '[:lower:]')
  if [$last_val_lower = "kb"]
    then
      compare_size=$((actual_val*1024))
  elif [$last_val_lower = "mb"]
        then
          compare_size=$((actual_val*1024*1024))
  elif [$last_val_lower = "gb"]
        then
          compare_size=$((actual_val*1024*1024*1024))
  elif [$last_val_lower = "tb"]
        then
          compare_size=$((actual_val*1024*1024*1024*1024))
  elif [$last_val_lower = "bb"]
        then
          compare_size=$((actual_val))
  else
        exit 1
  fi
  #filter_by_size main logic
  # will work on the input provided by last function
  awk -F ',,,,' -v test_size=$compare_size '{
     if($3>test_size)
     {
        print $0
     }
  }'
} # EOF filter_by_size function

# helper functions
# all these functions which will be used to assist other functions in small tasks
#not_empty () checks if provided file has value or not
not_empty () {
  if [ ! -z "$1"];
  then
    return 0;
  else
    return 1;
  fi;
}

# main program flag logic using case statment
# takes the path argument from script
dir_check () {
  if [[ $# -gt 0 ]]
  then
    DIRECTORY_PATH=$1
    if[[ -d "$DIRECTORY_PATH"]]
    then
      echo " "
      echo -e "${green} $DIRECTORY_PATH ${erase_color} is accurate"
      shift
    else
      echo -e "ERROR: ${red} $DIRECTORY_PATH ${erase_color} is not a directory path"
      usage_help
      exit 1
    fi
  fi
 }
 ###############################################
 ####### MAIN LOGIC STARTS HERE #################
 ###############################################
 # check if provided file or file path as 1st argument is correct
 if  [[ $# -gt 0 ]]
 then
   FILE_PATH=$1
   FILE_PATH=$1
       if[[ -f "$FILE_PATH"]]
       then
         echo " "
         echo -e "${green} $FILE_PATH ${erase_color} is accurate"
         echo $a
         echo ""
         shift
       else
         echo -e "ERROR: ${red} $FILE_PATH ${erase_color} unable to find file"
         echo ""
         usage_help
         exit 1
       fi
     fi



