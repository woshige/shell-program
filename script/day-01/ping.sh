#!/bin/bash
read -p "请输入您的ip：" ip
if [ -z ip ]; then
   echo "ip不能为空"
fi
ping -c1  $ip &>> /dev/null
result=$?
if [ $result -gt 0 ]; then
   echo "ip不通"
else
   echo "正常"
fi

