#!/bin/bash
export LC_COLLATE=C
shopt -s extglob
#choose id coulmn
#sdfdsf
while true; do

 read -p "From which table you want to update? (enter "\"back\"" to back)>> " tname
                if [[ "$tname" =~ $valid_pattern ]] &&  [ -f "$tname.csv" ] && [ "$tname" != "back" ] ; then
read -p "Select The coulmn You want to update>> " Updated_Coulmn 
read -p "Give and indicte to which record you want to update>> " indicator_coulmn
read -p "Give and indicte to which value_record you want to update>> " indicator_value
read -p "Please enter the updated value>> " updated_value

location_of_updated_field=$(awk -F: -v count=0 -v Updated_Coulmn=$Updated_Coulmn -v flag=0 'NR==1 {for(i=1;i<=NF;i++) {
gsub(/ /, "", $i);
    count++;
 

if (Updated_Coulmn==$i){
flag=1
break;
   
}

 

}}
END {
    if(flag==1){
        print(count)
    }
    else{
        print("NULL")
    }

}
 ' "./$tname.csv")
 location_of_indicator_field=$(awk -F: -v count=0 -v indicator_coulmn=$indicator_coulmn -v flag=0 'NR==1{ for(i=1;i<=NF;i++) {
gsub(/ /, "", $i);
    count++;

if (indicator_coulmn==$i){
flag=1
break;
   
}

 

}}
END {
    if(flag==1){
        print(count)
    }
    else{
        print("NULL")
    }

}
 ' "./$tname.csv")
  check_indicator_value_field=$(awk -F: -v count=0 -v indicator_value=$indicator_value -v flag=0 -v location_of_indicator_field=$location_of_indicator_field ' {
gsub(/ /, "", $location_of_indicator_field);
    count++;

if (indicator_value==$location_of_indicator_field){
flag=1
   
}

 

}
END {
    if(flag==1){
        print(count)
    }
    else{
        print("NULL")
    }

}
 ' "./$tname.csv")
 prim_key=$(awk -F: '{ if ( NR==2 ) { gsub(/ /, "", $2) ;print($2) }}' "${tname}_meta.csv")

        if [ -n "$Updated_Coulmn" ] && [ -n "$indicator_coulmn" ] && [ -n "$indicator_value" ] && [ -n "$updated_value" ] && [ "$location_of_updated_field" != "NULL" ] && [ "$location_of_indicator_field" != "NULL" ] && [ "$check_indicator_value_field" != "NULL" ] && [ "$location_of_updated_field" != "$prim_key" ]; then
    awk -F: -v location_of_indicator_field="$location_of_indicator_field" -v location_of_updated_field="$location_of_updated_field" -v value_of_indicatorfield="$indicator_value" -v newvalue="$updated_value" '
    {
        if ($location_of_indicator_field == value_of_indicatorfield) {
            gsub(/ /, "", newvalue);
            gsub(/ /, "", $location_of_updated_field);
            gsub($location_of_updated_field, newvalue);
        }
        print $0;
    }' "./$tname.csv" > temp.csv && mv temp.csv "./$tname.csv"
    echo "Updated successfully"
    break
else
    echo "Invalid Input"
fi

                elif [ "$tname" == "back" ]; then
                break;
                
                fi
                done



