#!/bin/bash
if [ ! $UID -eq 0 -o ! $USER == 'root' ];then
     echo "您当前不是root用户"
     exit 1
fi
read -p "请输入你要创建的用户前缀" prefix
if [ -z $prefix ];then
  echo "请输入有效值"
  exit 1
fi
read -p "请输入你要创建的用户数量" num
if [[ $num =~ ^[0-9]+$ ]];then
  echo "请输入整数"
  exit 1
fi
read -p "请输入你需要输入的统一的密码" passwd
echo "你要创建的用户是${prefix}1..${prefix}${num}"
read -p "你要创建的用户如下，你确定要创建吗？[y | n]" option
case $option in 
       y | Y | yes | YES)
                        for i in $(seq $num)
                        do
                        username=${prfiex}${i}
                        id $username &> /dev/null
                        if [ $? -eq 0 ];then
                            echo "$username 已经存在"
                        else
                            useradd $username
                            echo $passwd | passwd --stdin $username &> /dev/null
                            echo "$username 已经创建完毕"
                        fi                           
                        done
                        ;;
       n | N | no  | NO)
                        ;;
       *)
esac
