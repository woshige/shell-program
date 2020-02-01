#!/bin/bash
read -p "请输入你要创建的用户的个数:" num
read -p "请输入你要创建的用户的前缀:" prefix
if [ $num -eq 0 ];then 
   echo "没有创建任何用户"
fi
for i in $(seq $num)
do
     echo ${prfix}${i}
     id ${prefix}${i} &> /dev/null
     if [ $? -eq 0 ];then
        echo "该用户已经存在"
     else 
        useradd ${prefix}${i} &> /dev/null
     fi
done
