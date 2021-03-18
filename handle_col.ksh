#!/usr/bin/ksh

function handle_cols {
	# we will pass table_name to this function
	# first: we add table_name to meta file
	typeset -a meta_data
	#meta_data[0] = table_name
	#meta_data[0]=$1
	echo Table Name: $1 > $1.meta #we use overwite here.
	count=1
	echo please enter name of col number $count if you are done press \'q\'
	read col_name
	while test $col_name != "q"
	do
		meta_data[$count]=$col_name
		let count=$count+1
		echo enter name of col number $count, if you are done press \'q\'
		read col_name
	done
	echo Columns: ${meta_data[*]} >>$1.meta
	echo Columns Number: ${#meta_data[*]} >>$1.meta
# 	echo Number of Records: 0 >> $1.meta 
	echo $1 table created successfully with columns ${meta_data[*]}
}

handle_cols $1

