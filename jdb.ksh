#!/usr/bin/ksh
echo select action from menu
select choice in 'Create Database' 'List Databases' 'Connect To Database' 'Drop Database'
do
	case $choice in
		'Create Database') echo Enter database name:
			read db_name
			mkdir $db_name.db
			echo Database created successfully
			;;
		'List Databases') echo Databases  in the current directory  are
			ls *.db 
			;;
		'Connect To Database')
			echo available databases are
			ls -d *.db
			echo Enter database name to connect to:
			read dbName
			cd $dbName
			echo successfully connected to $dbName
			echo 'select option please'
			select option in 'Create Table' 'List Table' 'Drop Table' 'Insert into Table' 'Select From Table' 'Delete From Table'
			do
				case $option in
					'Create Table')
						echo enter table name
						read table_name
						touch $table_name.csv
						touch $table_name.meta
						echo table $table_name created successfully
						# call handle_col function, takes table_name as a parameter 
						.././handle_col.ksh $table_name
						;;
					'List Table')
						echo available tables are
						ls *.csv		
						;;
					'Drop Table')
						echo enter table name to drop
						read drop_table
						rm $drop_table
						echo table $drop_table has been dropped successfully
						;;
					'Insert into Table') echo 
						#here we get meta_data (cols name) and ask user for values of each
						# then we take this values and insert them
						.././insert.ksh
						;;
					'Select From Table')
                        .././select.ksh
                        ;;
					'Delete From Table')
                        .././delete.ksh
						;;
				esac
			done

			;;
		'Drop Database')
			echo avialable databases are:
			ls *.db
			echo choose database to drop:
			read drop
			rm -r $drop
			echo Database $drop dropped successfully
			;;
		esac
	done
