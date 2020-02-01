#!/bin/bash
while read userinfo
do
  username=$(echo $userinfo | cut -d : -f 1)
  passwd=$(echo $userinfo | cut -d : -f 2)
  echo $username
  echo $passwd
  id $username &> /dev/null
  if [ $? -eq 0 ];then
     userdel -r $username
     echo " 用户已经删除"
  else
     echo "$username 不存在"
  fi
done</root/user.txt
