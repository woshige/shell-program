#!/bin/bash
for i in 1 2 3 4 5
do
   echo $i
done
for j in {1..100}
do
   echo $j
done
## 按照分号作为分隔符  IFS来设定
IFS=$'\n'
for i in `cat /etc/hosts`
do
   echo $i
done
