Ubuntu netbeans字体美化
====

修改文件  
`vim /usr/local/netbeans-{version}/etc/netbeans.conf`

找到  
`netbeans_default_options="..."`

在最后添加参数值  
`-J-Dswing.aatext=true -J-Dawt.useSystemAAFontSettings=on`

保存退出vim

然后编辑文件  
`vim /usr/lib/jvm/java-{version}-sun/jre/lib/swing.properties`

添加配置项  
`swing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel`

修改jdk的字体配置

[下载Source Code Pro字体](https://github.com/adobe-fonts/Source-Code-Pro)

将Source Code Pro的ttf字体文件安装到  
`/usr/share/fonts/truetype/source-code-pro`  
如果没有source-code-pro文件夹可以自己手动创建

编辑文件  
`vim /usr/lib/jvm/java-{verasion}-sun/jre/lib/`

添加如下代码  
```
filename.Source_Code_Pro_Black=/usr/share/fonts/truetype/source-code-pro/SourceCodePro-Black.ttf
filename.Source_Code_Pro_ExtraLight=/usr/share/fonts/truetype/source-code-pro/SourceCodePro-ExtraLight.ttf
filename.Source_Code_Pro_Medium=/usr/share/fonts/truetype/source-code-pro/SourceCodePro-Medium.ttf
filename.Source_Code_Pro_Semibold=/usr/share/fonts/truetype/source-code-pro/SourceCodePro-Semibold.ttf
filename.Source_Code_Pro_Bold=/usr/share/fonts/truetype/source-code-pro/SourceCodePro-Bold.ttf
filename.Source_Code_Pro_Light=/usr/share/fonts/truetype/source-code-pro/SourceCodePro-Light.ttf
filename.Source_Code_Pro_Regular=/usr/share/fonts/truetype/source-code-pro/SourceCodePro-Regular.ttf
```

注释掉# Chinese fonts部分多余的字体定义，留下一个改为上面定义的某个Source Code Pro字体

保存退出
