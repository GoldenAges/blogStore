        Apache 2.4 版本配置和Apache 2.2配置语法有部分不同，具体参照
[Upgrading to 2.4 from 2.2](http://httpd.apache.org/docs/2.4/upgrading.html)
最值得注意的是文件夹的访问权限：

2.2的配置:

    #允许
    Order allow,deny
    Allow from all
    #拒绝
    Order deny,allow
    Deny from all

2.4的配置

    #允许
    Require all granted 
    #拒绝
    Require all denied

ps:所有的问题，文档才是终极解决之道，[官方文档](http://httpd.apache.org/docs/)

Apache最常用的基本配置：
安装完之后访问：localhost测试
配置文件目录`D:\wamp\bin\apache\apache2.4.9\conf`，文件名：`httpd.config`

第一步：打开虚拟主机配置
    注释掉`Include conf/extra/httpd-vhosts.conf`，并打开vhost的加载模块
第二步：允许.htaccess文件：
    `AllowOverride all`
第三步（可选）；打开目录的访问权限：
    在配置虚拟机的时候，增加`Options Indexes FollowSymLinks`

基本配置总结：

    <VirtualHost *:80>
    DocumentRoot "d:/www"
    AllowOverride all
    Options Indexes FollowSymLinks
    ServerName test.localhost
    #别名
    ServerAlias test.l
    ErrorLog "logs/test.error.logs"
    </VirtualHost>

