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
               $NGINX_HOME/sbin/nginx -t &> /dev/null
               if [ $? -eq 0 ];then
                 $NGINX_HOME/sbin/nginx -s reload
                 if [ $? -eq 0 ];then
                    action "nginx服务reload成功" /bin/true
                 else 
                    action "nginx服务reloade失败" /bin/false
                 fi
               else
                $NGINX_HOME/sbin/nginx -t &> $NGINX_HOME/logs/err.txt
                NGINX_CONF=$(awk -F "[: ]" 'NR==1{print $(NF-1)}'  $NGINX_HOME/logs/err.txt)
                NGINX_LINE=$(awk -F "[: ]" 'NR==1{print $(NF)}'  $NGINGX_HOME/logs/err.txt)
                read -p "是否要进入配置文件进行修改？[y|n]" re
                case $re in
                      y|yes|Y|YES)
                            vim +$(NGINGX_LINE)  $NGINX_CONF
                            ;;
                      n|no|NO|N)
                            echo "你可以选择手动修改，再见"
                            ;; 
                      *)
                            echo "Usage: $0 {y|n}"
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
