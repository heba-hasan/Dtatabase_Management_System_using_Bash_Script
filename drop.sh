#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

while true; do
  read -p "From which table you want to delete? (enter "\"back\"" to back)>> " tname
                if [[ "$tname" =~ $valid_pattern ]] &&  [ -f "$tname.csv" ] && [ "$tname" != "back" ] ; then
rm "$tname.csv"
rm "${tname}_meta.csv"
echo "Table dropped"
break;
elif [ "$tname" == "back" ]
then 
break
                else
                    echo "Invalid Table name"
                fi
done
