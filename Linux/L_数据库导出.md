
## 导出数据库

mysqldump -uroot -p'xxxxx' -S /home/pubsrv/mysql/logs/mysql.sock --databases zealer > zealer_dev.sql

### 导出数据和表结构
    mysqldump -uroot -p'xxxxx' --databases zealer > zealer_dev.sql

### 只导出表结构

    mysqldump -u用户名 -p密码 -d 要导出的数据库 > 新的数据库名

## 导入数据库
### 方法一
    create database databaseName;
    set names utf8;
    source /path/to/sql;

### 方法二
    mysql -u用户名 -p密码 新数据库名 < 源数据库.sql
