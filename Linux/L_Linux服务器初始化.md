refer: https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04
当你拥有一台新的 Linux Server 之后，为了增加安全性和易用性，你应该做这些初始化。
一般来说初始登录都是 root，以 root 用户来操作服务器是极为不安全的，所以首要做的就是添加新用户

1. 添加新用户
    `adduser username`

2. 对于默认添加的用户是没有 root 权限的，所以要赋予 root 权限
    
    ```
    sudo vim /etc/sudoers
    xxx ALL=(ALL) ALL
    ```

3. 添加密码
切换到root账户
```
    su
    passwd xxx(用户名)
```

4. 使用安全的 ssh_key 来登陆
    ssh_key 的生成很简单 `ssh-keygen`, 这条命令会在 ～/.ssh/ 目录下生成 id_rsa 和 id_rsa.pub，即私钥和公钥。

在本地通过 `ssh-copy-id USERNAME@SERVER_IP_ADDRESS`，然后键入密码，这时就会将本地的公钥添加至服务器 `~/.ssh/authorized_keys` 里，里面的内容就是已通过认证的公钥，当你使用这些客户端登录时，就不用使用密码

5. 禁止远程root登陆，修改默认端口
既然已经有了新用户，所以应该禁止root用户远程登录，还可以通过修改默认端口22，来达到增加安全性的目的，相关配置文件在`/etc/ssh/ssh_config` 或 `/etc/ssh/sshd_config`里

```
    PermitRootLogin yes => PermitRootLogin no
    Port 22 => Port 1993
```

6. 使改变生效
    重启 ssh 服务 `service ssh restart` 
    对于centOS `service sshd restart`

    重启之后不要登出，要先验证修改是否生效。打开一个新的命令行来验证刚才所作的改变
    如果是centOS，可能会报错：
    Failed to restart ssh.service: Unit ssh.service failed to load: No such file or directory.
    那么应该启动sshd服务

    systemctl enable sshd.service
    systemctl start sshd.service
    systemctl status sshd.service

7. 使用 SFTP
    https://www.digitalocean.com/community/tutorials/how-to-use-sftp-to-securely-transfer-files-with-a-remote-server
    当你配置好 ssh 登陆之后，就可以使用 sftp 来传输文件了，下载一个支持SFTP协议的客户端（FileZilla），然后输入相关信息即可

