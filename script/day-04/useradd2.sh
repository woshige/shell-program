#!/bin/bash
for i in $(cat /root/user.txt)
do
  username=$(echo $i | cut -d : -f 1)
  passwd=$(echo $i | cut -d : -f 2)
  echo "$username ----   $passwd"
  id $username &> /dev/null
  if [  $? -eq 0 ];then
      echo "用户已存在"
      echo $passwd | passwd --stdin $username &> /dev/null
      echo "密码已经修改"
  else
      useradd $username
      echo $passwd | passwd --stdin $username &> /dev/null
      echo "$username 用户已创建，密码已经生成"
  fi
done
