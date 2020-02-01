#!/bin/bash
source /etc/init.d/functions
if [ $# -eq 0 ];then
   echo "usage: option:[start|stop]"
   exit 1
fi
if [ $1 == "start" ];then 
   if [ ! -f /var/run/rsync.pid ];then
       touch /var/run/rsync.pid
       rsync --daemon
       action "rsync starting ..."  /bin/true
   else 
       echo "rsync is running"
   fi
elif [ $1 == "stop" ];then
   if [ -f /var/run/rsync.pid ];then
       rm -fr /var/run/rsync.pid
       pkill rsync
       action "rsync stopping..."  /bin/true
   else 
       action "rsyn service has been stopped"  /bin/false
   fi
else 
     echo "usage: option:[start|stop]"
     exit 1
fs
