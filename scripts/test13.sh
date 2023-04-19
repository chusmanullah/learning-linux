#!/bin/bash
# this program prints data to test.result
# and error messages to error.result
print_tree ()
{
	field_seperator=",,,,"
	local path=$1
	local indent=${2:-""}
	echo "${indent} $(basename "$path")"
	indent+=" "
	for item in "$path"/*; do
		if [[ -d "$item" ]]; then
			print_tree "$item" "$indent"
		else
			echo "${indent} $(basename "$item") | $(stat -c %s "$item")"
			echo "${indent} $item $field_seperator $(basename "$item")\
			$field_seperator $(stat -c %s "$item") $field_seperator $(stat -c %y "$item")\
			$field_seperator $(stat -c %Y "$item") $field_seperator $(stat -c %U "$item")"\
			1>> test.result 2>>test.error
		fi
	done
}

if [ -f "test.result" ]; then
    temp_date=$(date date +%Y_%m_%d_%H%M )
	temp_name="test.result-old$temp_date"
	mv test.result $temp_name

fi
	 
#removing file if exit
#rm test.result

#calling function
print_tree $1	