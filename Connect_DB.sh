#!/bin/bash
export LC_COLLATE=C
shopt -s extglob
current_script_path=$(dirname "$0")
while true; do
  read -p "Enter your Database name Or "\"back\"" to back >> " DBname
                if [[ "$DBname" =~ $valid_pattern ]] &&  [ -d "$DBname" ] && [ "$DBname" != "back" ] ; then
                    cd ./$DBname
                        # echo $PWD

 echo "Database Connected"
 source $current_script_path/manage_Table.sh

                    break
elif [ "$DBname" == "back" ]
then 
   
    cd $DB_path/Database
    # echo $PWD

    

# cd ./Database
break

                else
                    echo "Invalid Database name"
                fi
done
#cd ./Database

