#!/bin/bash
read -p "请输入用户的前缀：" pre
if [[ ! $pre =~ ^[a-Z]+$ ]];then
   echo "您输入的用户前缀不是english"
   exit 1
fi
read -p "请输入需要创建的用户的后缀" buttom
if [[ $buttom =~ ^[0-9]+$ ]];then
   user=${pre}${buttom}
   id $user
   if [ $? -eq 0 ];then
     echo "该用户已经存在"
   else
     useradd $user
     echo "用户创建成功${user}"
   fi
else 
   echo "输入的后缀的格式不正确"
fi
