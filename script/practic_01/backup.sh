#!/bin/bash
#将文件的名字修改为.bak后缀的
find /root/backup/ -iname "*.txt" | sed -r "s#(.*)#mv \1 \1.bak#" | bash
#将.bak为后缀的文件进行打包 123.tar.gz
tar -czvf 123.tar.gz $(find /root/backup/ -iname "*.bak")
#还原备份的名字
find /root/backup/ -iname "*.bak" | sed -r "s#(.*).bak#mv \1.bak \1#" | bash

