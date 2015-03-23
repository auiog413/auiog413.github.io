Ubuntu下安装bind9域名解析服务器
======

相关链接
------
* [bind9详解](http://zhumeng8337797.blog.163.com/blog/static/10076891420114181331604/)
* [Ubuntu上用Bind9构建Domain服务器](http://bftk.sl.blog.163.com/blog/static/2277724420131143714775/)
* [bind9服务器搭建](http://blog.csdn.net/firefoxbug/article/details/8143294)
* [bind9的view实现多线路的自动导向](http://www.renpeicheng.com/plus/view-2382-1.html)

安装dnstop监控dns流量
---------

`apt-get install dnstop`

日志配置
----

配置一定要放在`/etc/bind/named.conf`

```
logging {
    channel query_log {
        file "query.log" versions 3 size 20m;
        severity info;
        print-time yes;
        print-category   yes;
    };     
    category queries {
        query_log;
    };
};
```

**提示：**日志文件的存储路径由`/etc/bind/named.conf.options`的`derectory配置项指定

递归查询配置：
------

**配置文件：**`/etc/bind/named.conf.options`

```
forwarders {
	218.85.152.99;
	192.168.63.13;
	223.5.5.5;
	223.6.6.6;
	8.8.8.8;
	199.91.73.222;
	8.8.4.4;
	218.85.157.99;
	178.79.131.110;
};
```
