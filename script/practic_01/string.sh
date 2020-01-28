#!/bin/bash
string="BigData process is Hadoop,Hadoop is opoen source project"
echo $string
cat <<EOF
1)打印string的长度
2)删除字符串中所有的Hadoop
3)替换第一个Hadoop为Linux
4)替换全部的Hadoop为Linux
EOF
read -p "请输入数字1|2|3|4|，或者是q|Q" var
if [ $var -eq 1 ];then
  echo "字符串的长度为：${#string}"
  exit 0
fi
if [ $var -eq 2 ];then
  echo "${string//Hadoop/}"
  exit 0
fi
if [ $var -eq 3 ];then
  echo "${string/Hadoop/Linux}"
  exit 0
fi
if [ $var -eq 4 ];then
  echo "${string//Hadoop/Linux}"
  exit 0
fi
if [$var == 'Q' ];then
 exit 0;
fi
if [ $var == 'q' ];then 
  exit 0;
else
   echo "请使用正确的参数"
   exit 0
fi
