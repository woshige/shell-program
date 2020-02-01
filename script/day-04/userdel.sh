#!/bin/bash
read -p "请输入需要删除的用户的前缀：" prefix
read -p "请输入你要删除的用户的数量：" num
read -p "请确认你真的要删除此用户吗？[y|n]" option
case $option in 
           y | Y | yes | YES)
                            for i in $(seq $num)
                            do
                                username=${prefix}${i}
                                id $username &> /dev/null
                                if [ $? -eq 0 ];then
                                    userdel -r $username
                                    echo "用户$username已经成功删除"
                                else
                                    echo "用户$username 不存在"
                                fi
                            done
                            ;;
           n | N | no  | NO )
                            echo "已经停止删除"
                            ;;
           *)
            echo "usage: $0 [y|n]"
esac
