#!/bin/bash

################################################################################
# linux 上搭建基于ssh的git仓库
# 服务器端的操作，完成后提示客户端使用方法
#     操作步骤：
#         1、先检测用户git，没有则创建
#         2、
#         1、
#         1、
#         1、
#         1、
#         1、
#         1、
################################################################################

# 原始路径
origin_dir=`pwd`
echo "原始路径：$origin_dir";

# 目标路径
target_dir=$1

if [[ -z "$target_dir" || ${target_dir} = '-h' || $target_dir = '--help' ]]; then
     echo 'Usage: gitmk <TARGET> ["user1 user2 user3 ..."]';
     echo '    <TARGET> - git 仓库的绝对或相对路径。相对路径则在 /opt 目录下创建';
     echo '    ["user1 user2 user3 ..."] - 哪些用户将可以访问此仓库';
     exit;
fi

# 检测用户git是否存在
echo '检测用户 git 是否存在';
gituser=`grep git /etc/passwd | wc -l`;
if [[ ${gituser} -lt 1 ]]; then
     echo "创建用户 git"
     echo `useradd -m git`;
fi

# 检测用户组git是否存在
echo '检测用户组 git 是否存在';
gitgroup=`grep git /etc/group | wc -l`;
if [[ ${gituser} -lt 1 ]]; then
     echo "创建用户组 git"
     echo `groupadd git`;
     echo "将用户 git 加入用户组 git"
     echo `gpasswd -a git git`;
fi

# 为git用户设置密码
# ${varible##*string} 从左向右截取最后一个string后的字符串
# ${varible#*string}从左向右截取第一个string后的字符串
# ${varible%%string*}从右向左截取最后一个string后的字符串
# ${varible%string*}从右向左截取第一个string后的字符串

echo "读取 git 用户的密码设置状态，可能需要输入密码进行认证";
gitpasswd=`sudo grep git /etc/shadow`;
gitpasswd=${gitpasswd#*:}
if [[ ${gitpasswd:0:2} = '*:' ]]; then
     echo "为 git 设置密码"
     sudo passwd git
fi

# 切换到其他用户运行命令的知识 http://bbs.chinaunix.net/thread-2306026-1-1.html
if [[ ${target_dir:0:1} != '/' ]];
then
     target_dir="/opt/$target_dir"
     echo "你输入的是相对路径，项目将在如下路径创建${target_dir}"
fi

echo "检测仓库 ${target_dir} 是否存在";
if [[ -d "${target_dir}" ]]; then
     echo "仓库 ${target_dir} 已存在"
     exit;
fi

echo "创建仓库目录 ${target_dir}"
sudo mkdir ${target_dir}

echo "进入仓库目录 ${target_dir}"
cd ${target_dir}

echo '运行 sudo git --bare init';
sudo git --bare init
echo '运行 sudo git repo-config core.sharedRepository true';
sudo git repo-config core.sharedRepository true

cd ..
uplevel=`pwd`;
echo "返回上层目录 ${uplevel}";

echo "更改 ${target_dir} 的属主"
sudo chown git:git -R ${target_dir}

echo "修改 ${target_dir} 的组权限"
sudo -u git chmod g+ws -R ${target_dir}

iamwho=`whoami`;
sudo gpasswd -a $iamwho git

echo "仓库 ${target_dir} 创建完成。"
echo "进入您的代码目录，选择性地运行如下命令："
echo -e "\033[44;37;5m                                                                                ";
echo    '    $ git init                                                                  ';
user_repo="ssh://${iamwho}@127.0.0.1${target_dir}"
printf  "    $ git remote add origin %-52s\n" $user_repo;
echo    "    $ git add .                                                                 ";
echo    "    $ git commit -m 'something'                                                 ";
echo    "    $ git push origin master                                                    ";
echo -e "                                                                                \033[0m";

exit;
