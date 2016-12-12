1. 列出所有用户
`awk -F':' '{ print $1}' /etc/passwd`
2. 增加用户并设置用户权限
```
    adduser username
    su
    passwd xxx(用户名)
```

3. 删除用户
```
sudo userdel -rf username
```
若出现正在占用的情况，删除进程
kill -s PID