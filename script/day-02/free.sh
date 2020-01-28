#!/bin/bash
disk_use=$(df -h | grep "/$" | awk '{print $(NF-1)}')
echo ${disk_use%\%}
if [ ${disk_use%\%} -ge 80 ];then
    echo "您的磁盘使用率过高：${disk_use%\%}"
else
    echo "您的磁盘使用率正常：${disk_use%\%}"
fi 
