Ubuntu下安装vsftpd ftp服务器
==========

安装
----

`apt-get install vsftpd`

配置
----

编辑配置文件  
`vim /etc/vsftpd.conf`

```
local_enable=YES
write_enable=YES
local_umask=022
```

开启ftp的匿名读写
------

