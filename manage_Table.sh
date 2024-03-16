#!/bin/bash
export LC_COLLATE=C
shopt -s extglob
declare -a columns
declare -a type
export primary_key
select order in "Create Table" "List Tables" "Insert" "Select" "Delete from table" "Update row" "Drop Table" "exit"
do
case $REPLY in
"1")
source $current_script_path/createtable.sh
;;

"2")
ls ./
;;
"3")
source $current_script_path/Insert_To_Table.sh
;;
"4")
source $current_script_path/select.sh
;;
"5")
source $current_script_path/delete.sh
;;
"6")
source $current_script_path/update.sh
;;
"7")
source $current_script_path/drop.sh
;;
"8")
cd ../
# echo $PWD

break
;;
*)
echo "Your choice is INVALID" ;; 
esac
done
