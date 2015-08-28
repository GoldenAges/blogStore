[How To Install Linux, Apache, MySQL, PHP (LAMP) stack on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu)
翻译：
1. 
`sudo apt-get update`
`sudo apt-get install apache2`

2.
<!-- 安装mysql -->
`sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql`
`sudo mysql_install_db`
<!-- 安装向导 -->
`sudo /usr/bin/mysql_secure_installation`

3.
`sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt`



