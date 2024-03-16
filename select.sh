#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

while true; do
  read -p "From which table you want select? (enter "\"back\"" to back)>> " tname
                if [[ "$tname" =~ $valid_pattern ]] &&  [ -f "$tname.csv" ] && [ "$tname" != "back" ] ; then
select order in "Select All" "Select by column value" "Exit"
do
case $REPLY in
"1")
awk -F: '{

printf "--------------------------------------------------------------------------------------------------------------------------------------------"
printf "\n"
    for (i = 1; i <= NF; i++) {
        printf "%-20s", $i
    }
printf "\n"

}'  ./$tname.csv 


 echo "Selected"
 break
;;

"2")

while true;
do
  read -p "From which column you want select? (enter "\"back\"" to back) >> " cname
if [ -n "$cname" ] && [ "$cname" != "back" ]
then
c_field=$(awk -F ':' -v column_value="$cname" -v found=0 'NR==1 { count =0 ;for (i=1; i<=NF; i++){count++;gsub(/ /, "", $i); if ($i==column_value) { found=1; break;} } } END { if(found== 1) {print count} else {print ("null")} }' "./$tname.csv")
#echo $c_field
if [ "$c_field" != "null" ]
then
	c_name=$(awk -F ':' -v column_value="$c_field" 'NR==1 { print $column_value }' "./$tname.csv")

	select order in "Select Row by value" "Select only column" "Exit"
	do
	case $REPLY in
	"1")
	while true;
	do
	  read -p "Enter$c_name value (enter "\"back\"" to back):  >> " cvalue
	if [ -n "$cvalue" ] && [ "$cvalue" != "back" ]
	then
	awk -F: -v column_field=$c_field  -v c_value=$cvalue '{
	if (NR==1 || $column_field == c_value){
	printf "--------------------------------------------------------------------------------------------------------------------------------------------"
	printf "\n"
	    for (i = 1; i <= NF; i++) {
		printf "%-20s", $i
	    }
	printf "\n"
	}

	}'  ./$tname.csv 
	#awk -F: -v column_field=$c_field  -v c_value=$cvalue '{gsub(/ /, "", $column_field); if ( $column_field == c_value) {print $0} }' "./$tname.csv"
	break
	elif [ "$cvalue" == "back" ]
	then 
	break
	else 
	echo "Invalid input"
	fi
	done
	;;
	"2")
	awk -F: -v column_field=$c_field 'NR != 2 { gsub(/ /, "", $column_field) ;
	printf "--------------------------------------------------------------------------------------------------------------------------------------------"
	printf "\n";
	print $column_field;
	 printf "\n";

	}' "./$tname.csv"
	;;
	"3")
	break
	;;
	*)
	echo "Your choice is INVALID"
	;;
	esac
	done
	break

elif [ "$c_field" == "null" ]
then
echo "Invalid column name"
fi

elif [ "$cname" == "back" ]
then
break
else 
echo "Invalid column name"
fi
done

;;
"3")
break
;;
*)
echo "Your choice is INVALID" ;; 
esac
done

elif [ "$tname" == "back" ]
then 
break
                else
                    echo "Invalid Table name"
                fi
done
