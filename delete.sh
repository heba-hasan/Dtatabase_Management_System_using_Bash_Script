#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

while true; do
  read -p "From which table you want to delete? (enter "\"back\"" to back)>> " tname
                if [[ "$tname" =~ $valid_pattern ]] &&  [ -f "$tname.csv" ] && [ "$tname" != "back" ] ; then
select order in "Delete All" "Delete row" "Exit"
do
case $REPLY in
"1")
sed -i '3,$d' $tname.csv
 echo "Deleted"
 break
;;

"2")

while true;
do
  read -p "According to which column you want to delete? (enter "\"back\"" to back) >> " cname
if [ -n "$cname" ] && [ "$cname" != "back" ]
then
c_field=$(awk -F ':' -v column_value="$cname" -v found=0 'NR==1 { count =0 ;for (i=1; i<=NF; i++){count++;gsub(/ /, "", $i); if ($i==column_value) { found=1; break;} } } END { if(found== 1) {print count} else {print ("null")} }' "./$tname.csv")
#echo $c_field
if [ "$c_field" != "null" ]
then
	c_name=$(awk -F ':' -v column_value="$c_field" 'NR==1 { print $column_value }' "./$tname.csv")

	while true;
	do
	  read -p "Enter$c_name value (enter "\"back\"" to back):  >> " cvalue
	if [ -n "$cvalue" ] && [ "$cvalue" != "back" ]
	then
 awk -F: -v column_field="$c_field" -v c_value="$cvalue" -v tname="$tname" '{
                                            if ($column_field == c_value) {
                                                row_num=NR
                                                system("sed -i '\''" row_num "d'\'' ./" tname ".csv")
                                            }
                                        }' "./$tname.csv"

 echo "Row deleted succesfully"
	break
	elif [ "$cvalue" == "back" ]
	then 
	break
	else 
	echo "Invalid input"
	fi
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
