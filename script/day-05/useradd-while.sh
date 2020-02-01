#!/bin/bash
read -p "请输入要创建的用户的前缀：" prefix
if [ -z $prefix ];then
  echo "您输入的前缀为空"
  exit 1
fi
read -p "请输入要创建的用户的数量：" num
if [[ !  $num =~ ^[0-9]+$ ]];then
  echo "您输入的用户的数量格式不正确"
fi
i=0
while [ $i -lt $num ]
do
  let i++
  username=${prefix}$i
  id $username &> /dev/null
  if [ $? -eq 0 ];then
     echo "用户已经存在"
  else 
     useradd $username
     echo "用户创建成功"
  fi
done
