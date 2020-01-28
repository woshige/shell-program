#!/bin/bash
read -p "请输入您想要修改的主机的名称" HostName
read -p "你确定要修改主机的名称为：$HostName ？[Y|N]" rc
# 字符串比较是 == ，数字的比较实用 -eq
if [ $rc == "Y" ];then
       hostnamectl set-hostname $HostName
else
       exit 1
fi
