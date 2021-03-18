#!/usr/bin/ksh

function insert {

	echo available tables are:
	ls *.csv
	echo select table to insert into
	read table
	echo $table table is selected
	table_without_csv_string=$(awk -F. '{print $1}' <<<$table)
	table_meta=$table_without_csv_string.meta
	columns_all_line=$(grep '^Columns:' $table_meta) # get the line that startswith Columns:
	columns_names=$(cut -b 10- <<< $columns_all_line)  # cut 'Columns: ' string from second line to get cols name only
	#number_of_current_records_line=$(grep '^Number' $table_meta)
	#number_of_current_records=$(cut -b 20- <<< $number_of_current_records_line)
	#let this_record_number=$number_of_current_records+1
	echo The required columns are, $columns_names
	typeset -a values
	count=0
	for col in $columns_names
	do
		echo please enter $col
		read value
		values[$count]=$value
		let count=$count+1
    done
	echo ${values[*]} >> $table
	commass=$(sed -i "s/\s/,/g" $table)
	}

insert 
