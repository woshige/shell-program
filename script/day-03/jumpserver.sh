#!/bin/bash
info(){
cat << EOF
------------------------
|  1) 192.168.182.101  |
|  2) 192.168.182.102  |
|  3) 192.168.182.103  |
|  h) help             |
------------------------
EOF
}
info
while true
do
 read -p "请输入您想要执行的选项 [1|2|3|h]" option
 case $option in 
           1) 
              ssh root@192.168.182.101
              ;;
           2)
              ssh root@192.168.182.102
              ;;
           3)
              ssh root@192.168.182.103
              ;;
           h)
              clear 
              info
              ;;
           *)
             echo "usage: $0 [1|2|3|h]"
 esac
done
