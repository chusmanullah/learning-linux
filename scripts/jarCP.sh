#!/bin/bash
#this script is used to rename old bdr file for archieve
# move it to archieve and rename new jar file as bdr.jar
# rename from bdr.jar to bdr-2022-10-25-hhmm.jar
# move above jar to archieve folder

#myfile=$bdr.jar
tempjarname=$(ls -l bdr.jar | awk '{print "bdr-2022-"$6$7 "-" $8}' | awk -F: '{print $1 $2".jar"}')
mv bdr.jar $tempjarname
mv $tempjarname archieve/$tempjarname
temp=$(ls *.jar)
mv $temp bdr.jar
chmod 755 bdr.jar


