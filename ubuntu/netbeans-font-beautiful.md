Ubuntu netbeans字体美化
====

修改文件

```vim /usr/local/netbeans-{version}/etc/netbeans.conf```
    
找到

```netbeans_default_options="..."```

在最后添加参数值

```-J-Dswing.aatext=true -J-Dawt.useSystemAAFontSettings=on```

编辑文件

```vim /usr/lib/jvm/java-{version}-sun/jre/lib/swing.properties```

添加配置项

```swing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel```
