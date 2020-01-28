#!/bin/bash
DeskPath=/root/backup/mysql
[ -d $DeskPath ] || mkdir -p $DeskPath
read -p "请输入你需要备份的数据库名称"

