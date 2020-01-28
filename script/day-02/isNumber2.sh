#!/bin/bash
read -p "please input a number" num
if [[ $num =~ ^[-]?[0-9]+$ ]];then
   echo "您输入的是一个整数"
else 
   echo "您输入的不是一个整数"
fi
