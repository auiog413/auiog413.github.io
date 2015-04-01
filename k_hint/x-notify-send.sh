#!/bin/bash

# 注册使用允许使用 xserver
xhost +local:
# 使用 notify-send 发送消息给系统气泡
DISPLAY=:0.0 /usr/bin/notify-send -t 10000 $1 "$2" -i $3
xhost
### End of File x-notify-send.sh ###
