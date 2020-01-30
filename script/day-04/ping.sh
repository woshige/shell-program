#!/bin/bash
for i in  {1..254}
do
 {
  ping -c 1 -w 1 192.168.182.${i} &> /dev/null
  if [ $? -eq 0 ];then
     echo "192.168.182.${i} 能够ping通"
  else 
     echo "192.168.182.${i} 不能够ping通" 
  fi
  } &
done
wait
echo "ip is down"
