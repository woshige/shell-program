#!/bin/bash
#监控内存百分比超过80%，进行报警
free_use=$(free -m | grep ^M | awk '{print $3/$2*100}')
result=${free_use%.*}
echo $result
if [ $result -gt 80 ];then 
    echo "您的内存超过了80%，当前是: $result"
else 
    echo "您的内存使用率正常，当前是: $result"
fi
