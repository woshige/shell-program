#!/bin/bash
while read userinfo
do
  username=$(echo $userinfo | cut -d : -f 1)
  passwd=$(echo $userinfo | cut -d : -f 2)
  echo $username
  echo $passwd
  id $username &> /dev/null
  if [ $? -eq 0 ];then
     echo "$username 用户已存在"
  else
     useradd $username
     echo $passwd | passwd -stdin $username &> /dev/null
     echo "$username 用户已创建完毕"
  fi
done</root/user.txt
