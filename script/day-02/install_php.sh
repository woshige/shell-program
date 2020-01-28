#!/bin/bash
cat << EOF
----------------------
| 1.install php 5.5
| 2.install php 5.6
| 3.install php 7.0
----------------------
EOF
read -p "请输入你要安装的php版本[1|2|3|q]:" install
if [[ ! $install =~ ^[1-4]$ ]];then
   echo "请输入正确的格式[1|2|3|4]"
   exit 1
fi
if [ $install -eq 1 ];then
   sleep 2
   echo "php 5.5"
elif [ $install -eq 2 ];then
   sleep 2
   echo "php 5.6"
else 
   sleep 2
   echo "php 7.0"
fi 
