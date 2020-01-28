#!/bin/bash
if [ $# -ne 1 ];then
   echo "请输入服务的名称，例如：bash $0 [sshd|httpd|...]"
   exit 1
fi
systemctl status "$1" &>> /dev/null
result=$?
if [ $result -eq 0 ];then 
   echo "${1}服务正在运行"
elif [ $result -eq 4 ];then
   echo "${1}服务没有安装"
else
   echo "${1}服务没有运行"
fi
