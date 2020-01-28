#!/bin/bash
if [ $# -ne 1 ];then
  echo "请输入一个参数"
fi
if grep "$1" /etc/passwd;then
   echo "ok"
  else 
   echo "error"
fi
