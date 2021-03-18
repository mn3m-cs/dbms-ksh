#!/usr/bin/ksh

function delete_record {
echo available tables are
ls *.csv
echo choose table to delete from 
read table
table_without_csv_string=$(awk -F. '{print $1}' <<<$table)
table_meta=$table_without_csv_string.meta
columns_all_line=$(grep '^Columns:' $table_meta)
columns_names=$(cut -b 10- <<< $columns_all_line)
echo columns are $columns_names
echo choose one to delete by
read selected_col
echo enter $selected_col value
read value
field_number=1
for col in $columns_names
do
	if test $col == $selected_col
	then 
# 		re=$(awk -F, -v n=$field_number -v val=$value  '{ if ( $n == val ) print $0 }' $table)
#         echo $re
        file_after_delete=$(grep -v $value  $table)
        formatted_file=$(sed 's/\s\+/\n/g' <<< $file_after_delete)
#         echo $formatted_file > $table
        echo $file_after_delete
        echo $formatted_file > $table
	else
		let field_number=$field_number+1
	fi
done
}

delete_record
