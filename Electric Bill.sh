#!/bin/bash

while :
do

clear 
echo ----------------------------------------------------------------
echo "$(tput setaf 4)                CALCULATE ELECTRICITY BILL $(tput sgr 0)" 
echo ---------------------------------------------------------------- 
echo "CONSUMER TYPE"
echo "$(tput setaf 2)1)RESIDENTIAL$(tput sgr 0)"
echo "$(tput setaf 3)2)COMMERCIAL$(tput sgr 0)"
echo "$(tput setaf 1)3)INDUSTRIAL$(tput sgr 0)"
read -p " SELECT CONSUMER TYPE  " usr_cmd
case $usr_cmd in
1)echo "$(tput setaf 2)YOU ARE RESIDENTIAL USER!!$(tput sgr 0)" 
echo Enter the Consumer Name-
read name 
echo Enter Your 5 Digit Consumer Number-
read mno 
search_query=$mno
echo "SEARCH RESULTS :"
echo ""
grep -i $search_query restro.log
echo Enter the Current month Reading- 
read cmr 
echo Enter the Last month reading-
read lmr 
unit=$(expr $cmr - $lmr) 
if [ $unit -eq 0 ] && [ $unit -le 30 ]
then 
 charge=40 
elif [ $unit -gt 0 ] && [ $unit -le 100 ] 
then 
 charge=$(expr $unit \* 7) 
elif [ $unit -gt 100 ] && [ $unit -le 300 ] 
then 
 charge=$(expr $unit \* 9) 
elif [ $unit -gt 300 ]
then  
 charge=$(expr $unit \* 11)  
fi 
echo -----------------------------------------  
echo '       ELECTRICITY BILLING             ' 
echo ----------------------------------------- 
echo "CONSUMER NAME         : $name" 
echo "CONSUMER NUMBER       : $mno" 
echo "CURRENT MONTH READING : $cmr" 
echo "LAST MONTH READING    : $lmr" 
echo "UNIT                  : $unit" 
echo "$(tput setaf 4)TOTAL BILL            : ₹$charge $(tput sgr 0)" 
echo "-----------------------------------------" 
echo "$mno : $name : $unit" >> restro.log
echo "saved succesfully"

;;

2)echo "$(tput setaf 3)YOU ARE A COMMERCIAL USER!! $(tput sgr 0)"

echo Enter The Consumer Name-
read name 
echo Enter the 5 Digit Consumer Number-
read mno 
search_query=$mno
echo "SEARCH RESULTS :"
echo ""
grep -i $search_query restro.log
echo Enter the Current month Reading- 
read cmr 
echo Enter the Last month reading-
read lmr 
unit=$(expr $cmr - $lmr) 
if [ $unit -gt 0 ] && [ $unit -le 200 ] 
then 
 charge=$(expr $unit \* 12   ) 
elif [ $unit -gt 200 ]
then 
charge=$(expr $unit \* 15 )  
fi 
echo -----------------------------------------  
echo '        ELECTRICITY BILLING             ' 
echo ----------------------------------------- 
echo "CONSUMER NAME                  : $name" 
echo "CONSUMER NUMBER       : $mno" 
echo "CURRENT MONTH READING : $cmr" 
echo "LAST MONTH READING    : $lmr" 
echo "UNIT                  : $unit" 
echo "$(tput setaf 4)TOTAL BILL            : ₹$charge$(tput sgr 0)" 
echo ----------------------------------------- 
echo "$mno : $name : $unit" >> restro.log
echo "saved succesfully"
;; 

3)echo "$(tput setaf 1)YOU ARE A INDUSTRIAL USER!!$(tput sgr 0)"

echo Enter the Consumer Name-
read name 
echo Enter the 5 Digit Consumer Number-
read mno 
search_query=$mno
echo "SEARCH RESULTS :"
echo ""
grep -i $search_query restro.log
echo Enter the Current month Reading- 
read cmr 
echo Enter the Last month reading-
read lmr 
unit=$(expr $cmr - $lmr) 
if [ $unit -gt 0 ] && [ $unit -le 1000 ] 
then 
 charge=$(expr $unit \* 17 ) 
elif [ $unit -gt 1000 ]
then
charge=$(expr $unit \* 20  )  
fi 
echo -----------------------------------------  
echo '        ELECTRICITY BILLING             ' 
echo ----------------------------------------- 
echo "CONSUMER NAME         : $name" 
echo "CONSUMER NUMBER       : $mno" 
echo "CURRENT MONTH READING : $cmr" 
echo "LAST MONTH READING    : $lmr" 
echo "UNIT                  : $unit" 
echo "$(tput setaf 4)TOTAL BILL            : ₹$charge $(tput sgr 0)" 
echo ----------------------------------------- 
echo "$mno : $name : $unit" >> restro.log
echo "saved succesfully"
;; 


*)
echo "INVALID OPTION";;

esac;

read -p "Press 0 to quit , anything else To Repeat " confirm_exit
if [ $confirm_exit -eq 0 ]
then break
fi
done


