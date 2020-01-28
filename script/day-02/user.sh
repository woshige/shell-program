#!/bin/bash
if [ $# -ne 1 ];then
  echo "请输入至少一个参数"
fi
if grep "$1" /etc/passwd;then
   echo "系统中存在：${1}用户"
elif ls -d /root/$1;then
   echo "系统中不存在：${1}用户，但是存在家目录"
else 
   echo "系统中不存在：${1}用户，也不存在家目录"
fi
