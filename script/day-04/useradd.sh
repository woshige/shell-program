#!/bin/bash
for i in $(cat /root/user.txt)
do
  useradd $i &> /dev/null
  if [ $? -eq 0 ];then
     echo "$i 已经创建成功"
  else
     echo "$i 已经存在"
  fi
done
