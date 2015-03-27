Ubuntu下解决本地多个ssh-key的问题
=====

相关链接
------

* [关于git的ssh-key:解决本地多个ssh-key的问题](http://blog.csdn.net/chaihuasong/article/details/37886139)

操作步骤
----
1.创建ssh个人配置文件`/home/username/.ssh/config`

2.赋予ssh个人配置文件正确的权限（600）：
`chmod 600 /home/username/.ssh/config`

3.在配置文件中加入如下代码，可以加入多段配置

```
Host <hostname>

    IdentityFile <path/to/rsa_private_key>
    User <username>
```

更多配置
----

更多的配置选项请参考[man ssh_config](http://man.he.net/man5/ssh_config)