[How To Install and Secure phpMyAdmin on Ubuntu 12.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-12-04)

install phpMyAdmin
    
    sudo apt-get install phpmyadmin apache2-utils

将phpmyadmin的配置文件添加到apache里面

    vi /etc/apache2/apache2.conf

    Include /etc/phpMyAdmin/apache.conf
    service apache2 restart

for security

    vi /etc/phpmyadmin/apache.conf

Under the directory section, add the line “AllowOverride All” under “Directory Index”, making the section look like this:

    <Directory /usr/share/phpmyadmin>
    Options FollowSymLinks
    DirectoryIndex index.php
    AllowOverride All
    </Directory>

configure .htaccess file

    vi /usr/share/phpmyadmin/.htaccess

Follow up by setting up the user authorization within .htaccess file. Copy and paste the following text in:

    AuthType Basic
    AuthName "Restricted Files"
    AuthUserFile /etc/apache2/.phpmyadmin.htpasswd
    Require valid-user

Create the htpasswd file

    htpasswd -c /etc/apache2/.phpmyadmin.htpasswd username

restart service

    service apache2 restart

