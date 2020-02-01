#!/bin/bash
source /etc/init.d/functions
if [ -f /tmp/lock ];then
      action "启动脚本在另一个进程中执行"
      exit 1
else
    touch /tmp/lock
fi
NGINX_HOME=/usr/local/nginx
rc=$1
case $rc in
     start)
           if [ -f $NGINX_HOME/logs/nginx.pid ];then
                  action "nginx服务已经启动"   /bin/false
           else 
                  ${NGINX_HOME}/sbin/nginx
                  action "nginx服务正在启动中" /bin/true
           fi
            ;;
     stop)
           if [ -f $NGINX_HOME/logs/nginx.pid ];then
                 ${NGINX_HOME}/sbin/nginx -s stop
                 if [ $? -eq 0 ];then
                    action "nginx服务关闭成功"  /bin/true
                 else 
                    action "nginx服务关闭失败"  /bin/false
                 fi
           else
                    action "nginx服务已经关闭"  /bin/false
           fi
            ;;
     reload)
            if [ -f $NGINX_HOME/logs/nginx.log ];then
                 $NGINX_HOME/sbin/nginx -s reload
                 if [ $? -eq 0 ];then
                    action "nginx服务reload成功" /bin/true
                 else 
                    action "nginx服务reloade失败" /bin/false
                 fi
            else 
                    action "nginx服务没有启动"    /bin/false
            fi
            ;;
     status)
            if [ -f $NGINX_HOME/logs/nginx.pid ];then
                 nginx_status=$(cat ${NGINX_HOME}/logs/nginx.pid)
                 echo "nginx  ($nginx_status) is runnning"
            else 
                 echo "nginx is inactive"
            fi  
            ;;
     *)
         echo "usage:$(0) [ start | stop | reload | status ]"
esac
rm -fr /tmp/lock
