参考:
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-centos-6
系统：
CentOS 7.2 64位

1. 安装Apache

    sudo yum install httpd
    sudo service httpd start

访问ip，即可以得到这个页面
![](http://7xscq6.com1.z0.glb.clouddn.com/2016-11-17-071945.jpg)

2. 安装MySQL

参考：
https://www.linode.com/docs/databases/mysql/how-to-install-mysql-on-centos-7

添加源：

    wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
    sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
    sudo yum update
    sudo yum install mysql-server
    sudo service mysqld start

设置root用户

    sudo /usr/bin/mysql_secure_installation

启动服务

    service mysqld start

登录数据库

    mysql -uroot -p 

3. 安装MySQL

默认安装(CentOS 7 默认版本是5.4.5)

    sudo yum install php php-mysql

如果你想要安装特定版本的PHP呢？(暂时失败)
参考：https://webtatic.com/packages/php56/


4. 添加联动启动

We should also set the processes to run automatically when the server boots (php will run automatically once Apache starts):

sudo chkconfig httpd on
sudo chkconfig mysqld on

5. vi /va/www/html/phpinfo.php > echo <?php phpinfo();?>

    service httpd restart;
















