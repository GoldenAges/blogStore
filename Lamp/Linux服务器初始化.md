当你拥有一台新的 Linux Server 之后，为了增加安全性和易用性，你应该做这些初始化。
一般来说初始登录都是 root，以 root 用户来操作服务器是极为不安全的，所以首要做的就是添加新用户
1. 添加新用户
    `adduser username`
对于默认添加的用户是没有 root 权限的，所以要赋予 root 权限
    `gpasswd -a richard sudo`
2. 使用安全的 ssh_key 来登陆
    ssh_key 的生成很简单 `ssh-keygen`, 这条命令会在 ～/.ssh/ 目录下生成 id_rsa 和 id_rsa.pub，即私钥和公钥。

在本地通过 `ssh-copy-id USERNAME@SERVER_IP_ADDRESS`，然后键入密码，这时就会将本地的公钥添加至服务器 `~/.ssh/authorized_keys` 里，里面的内容就是已通过认证的公钥，当你使用这些客户端登录时，就不用使用密码

3. 禁止远程root登陆，修改默认端口
既然已经有了新用户，所以应该禁止root用户远程登录，还可以通过修改默认端口22，来达到增加安全性的目的，相关配置文件在`/etc/ssh/sshd_config`里
4. 使改变生效
    重启 ssh 服务 `service ssh restart`。重启之后不要登出，要先验证修改是否生效。打开一个新的命令行来验证刚才所作的改变


