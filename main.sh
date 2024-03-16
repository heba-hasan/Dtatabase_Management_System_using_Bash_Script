#!/bin/bash
export LC_COLLATE=C
shopt -s extglob
current_script_path=$(dirname "$0")
# echo "Path of the current script file: $current_script_path"
valid_pattern='^[A-Za-z][A-Za-z0-9_]*$'
export DB_path=$PWD
checkBDExistence(){
dires=$(ls -F $PWD | grep /)
flag=0
for folder in $dires
do
    if [ "$(ls -d "$folder")" == "Database/" ]
    then 
        flag=1
break;
    else 
        #echo "Database doesn't exist"
        flag=0
    fi
done
if [ $flag -eq 0 ]
then 
mkdir $DB_path/Database
echo "Database Installed succesfuly"
else 
        echo "Database_Sys exists"
fi
cd $DB_path/Database
}

manageDB()
{
select order in "Create Database" "List Databases" "Connect Database" "Drop Database" "exit"
do
case $REPLY in
"1")
source  $current_script_path/createDB.sh
;;
"2")

ls -F $DB_path/Database | grep "/"
# echo $PWD
;;
"3")

source  $current_script_path/Connect_DB.sh
;;
"4")

source $current_script_path/drop_DB.sh
;;
"5")
break
;;
*)
echo "Your choice is INVALID" ;; 
esac
done
}
checkBDExistence
manageDB
