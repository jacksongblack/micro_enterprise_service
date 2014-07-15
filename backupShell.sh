#!/bin/bash
#本脚本为自动备份中小微项目网站的数据备份
#备份内容 文件夹/public/ckeditor_assets,/public/system 
#数据库micro_enterprise_service_development 
echo "准备进入备份程序"
echo "创建临时目录"
dirname = 
function main {
  get_current_time
  make_cache_dir 
}

function get_current_time {
 date +%Y%m%d%I%M%s
 dirname = $?
 echo $?
}

function make_cache_dir {
 echo $dirname
 mkdir $dirname
}

main

