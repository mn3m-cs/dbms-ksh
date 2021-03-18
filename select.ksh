#!/usr/bin/ksh

function select_record {
echo available tables are
ls *.csv
echo choose table to select from 
read table
table_without_csv_string=$(awk -F. '{print $1}' <<<$table)
table_meta=$table_without_csv_string.meta
columns_all_line=$(grep '^Columns:' $table_meta)
columns_names=$(cut -b 10- <<< $columns_all_line)
echo columns are $columns_names
echo choose one to select by
read selected_col
echo enter $selected_col value
read value
# grep $value $table
field_number=1
for col in $columns_names
do
	if test $col == $selected_col
	then 
# 	echo equal
		re=$(awk -F, -v n=$field_number -v val=$value  '{ if ( $n == val ) print $0 }' $table)
#         re=`awk -F, -v n=$field_number '{print $n }' $table`
		echo $re
	else
		let field_number=$field_number+1
#         echo $field_number
	fi
done

}


select_record
