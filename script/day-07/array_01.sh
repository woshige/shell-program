#!/bin/bash
while read line
do
  array[i++]=$line
done</etc/passwd
for i in ${!array[*]}
do
     echo "数组索引为 $i 的值为： ${array[$i]}"
done
