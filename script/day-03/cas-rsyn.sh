#!/bin/bash
source /etc/init.d/functions
rs=$1
case $rs in
    start)
       if [ ! -f /var/run/rsync.pid ];then
          touch /var/run/rsync.pid
          rsync --daemon
          action "rsync is starting ...." /bin/true
       else
          action "rsync has been started..." /bin/false
       fi	
            ;;
    stop) 
       if [ -f /var/run/rsync.pid ];then
          rm -fr /var/run/rsync.pid
          pkill rsync
          action "rsync is stopping..." /bin/true
       else
          action "rsync has been stopped" /bin/false
       fi
            ;;
    status)
       if [ -f /var/run/rsync.pid ];then
          echo "rsync is running"
       else
          status=$(ps -aux | grep rsync | grep -v grep | grep -v pts | awk '{print $2}')
          echo "rsync is inactive: ${status}"   
       fi
            ;;
    *)
            echo "usage:[stop|start]"
esac
