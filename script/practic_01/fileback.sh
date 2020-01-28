#!/bin/bash
DeskPath=/root/bak
[ ! -d /root/bak ] && mkdir -p $DeskPath
tar -czvf $DeskPath/$(date +%Y_%m_%d)_etc.tar.gz /etc/
