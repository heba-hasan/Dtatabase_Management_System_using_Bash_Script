#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

while true; do
  read -p "Enter your Database name Or "\"back\"" to back >> " DBname
                if [[ "$DBname" =~ $valid_pattern ]] &&  [ -d "$DBname" ] && [ "$DBname" != "back" ] ; then
                    rm -r ./$DBname
 echo "Database deleted"
                    break
elif [ "$DBname" == "back" ]
then 
break
                else
                    echo "Invalid Database name"
                fi
done
