#!/bin/bash
read -p "请输入你的分数：" fs
if [ $fs -ge 0 -a $fs -lt 60 ];then
   echo "补考"
elif [ $fs -ge 60 -a $fs -lt 80 ];then
   echo "合格"
elif [ $fs -ge 80 -a $fs -le 100 ];then
   echo "优秀"
else 
   echo "你输入的成绩是不合法的"
fi
