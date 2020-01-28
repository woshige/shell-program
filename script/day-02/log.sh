#!/bin/bash
# if [ $UID -eq 0 ];then
if [ !$USER == "root" -o !$UID -eq 0 ];then
   echo "您不是root用户"
   exit 1
else
   if [ -f /var/log/message ];then
       tail -n 100 /var/log/message > /root/backup/message.bak
       cat /root/backup/message.bak > /var/log/message
   else
       echo "/var/log/message不存在"
   fi
fi
