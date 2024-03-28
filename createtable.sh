
#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

declare -a columns
declare -a type

while true; do
 columns=()  
    types=()  
  read -p "Enter your Table name Or "\"back\"" to back >>" Tname
  if [[ "$Tname" =~ $valid_pattern ]] && [ "$Tname" != "back" ] && [ ! -f "./$Tname.csv" ] && [ -n "$Tname" ];
 then
 	while true; 
	do      
		 read -p "Enter the number of columns for $Tname:" num_columns
		if [[ $num_columns =~ [2-9] ]]
			then
			break
			else 
			echo "Invalid input"
			continue
		fi
	done

 for((i=1;i<=$num_columns;i++));
 do
	while true;

	 do
	 
		read -p "Enter the name of column $i:" column_name
		if [ -n "$column_name" ] && [[ $column_name =~ $valid_pattern ]] && [[ ! "${columns[*]}" =~ "$column_name" ]]
		then
		break;
		else 
		echo "Invalid input"
		continue		
		fi
        done
 columns+=("$column_name:")

	while true; 
	do 
		read -p "Enter the types of column (string/int) $i:" column_type
		if [ -n "$column_type" ] && [[ "$column_type" == "int" || "$column_type" == "string" ]];
		then
		break;
                else 
		echo "Invalid input"
		continue
		fi
	done

types+=("$column_type:")

 done

while true; do 
read -p "Please indicate the primary key: " primary_key
if [ -n "$primary_key" ] && [[ "${columns[*]}" =~ "$primary_key:" ]]
then
	break
                else 
                      echo "Invalid primary key. Please enter a column name from the list."
		continue
fi
done



	touch  "./$Tname.csv"
touch  "./"$Tname"_meta.csv"
	 echo "Table $Tname created with columns: ${columns[*]} and primary key:$primary_key"
	echo "${columns[*]}">>"./$Tname.csv"
	echo "${types[*]}">>"./$Tname.csv"
 pk_field=$(awk -F ':' -v primary_key="$primary_key" 'NR==1 { count =0 ;for (i=1; i<=NF; i++){count++;gsub(/ /, "", $i); if ($i==primary_key) { break;} } } END { print count }' "./$Tname.csv")

echo "columns_no:Primary_key in filed "  >>"./"$Tname"_meta.csv"
echo "$num_columns:$pk_field"  >>"./"$Tname"_meta.csv"
	break

elif [ "$Tname" == "back" ]
then 
break
elif [ -f "./$Tname.csv" ]
then 
echo "This table already exists"
else
echo "Invalid Table name"
fi
	
done           

