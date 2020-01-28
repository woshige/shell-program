#!/bin/bash
flag=true
read -p "please input a number:" number
while $flag
 do 
  expr $number + 0 &> /dev/null
  [ $? -eq 0 ] && flag=false || read -p "please input a number:" number
done
