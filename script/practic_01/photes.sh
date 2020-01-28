#!/bin/bash
for i in $(ls /root/photoes/*.jepg);do
    mv $i ${i%.*}.jpg
done
