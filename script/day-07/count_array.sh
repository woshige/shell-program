#!/bin/bash
declare -A sex_array
while read line
do
  sex=$(echo $line| awk '{print $1}')
  let sex_array[$sex]++ 
done</root/sex.txt
for i in ${!sex_array[*]}
do
  echo "性别为 $i 的人数为 ${sex_array[$i]}"
done
