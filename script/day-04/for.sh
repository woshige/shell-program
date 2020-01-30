#!/bin/bash
for file in $(ls /root/ | grep file)
do
  cat $file
done
