[参考](https://www.logcg.com/archives/897.html)

在使用SSH管理服务器的时候，如果你很长一段时间不做任何操作，可能出现
“Write failed: Broken pipe”


都是开启一个发送keep-alive包的功能，这样会允许客户端/服务器在一定时间内发送一个特定的包给对方，一旦超时，则说明断线，就关闭链接。这样就避免了链接长时间挂着导致报错。而且，一旦再次报错，稍等片刻便可以再次登录啦。
两种方式：
1. 客户端定时发送心跳包给服务器（只需在客户端修改）

```
//编辑文件：
 ~/.sshd/config
//在里边添加如下语句：
ServerAliveInterval 60
ServerAliveCountMax 1

//针对某一服务器的写法：
//使用如下选项连接服务器：
ssh -o ServerAliveInterval=60 user@sshserver
```


2. 服务端定时发送心跳包给客户端

```
//编辑文件：(针对所有用户，如果针对特点用户则编辑/新建 /home/username/.ssh/config)
/etc/ssh/sshd_config
//在内容末尾添加如下语句：
ClientAliveInterval 60
# ClientAliveCountMax 1 默认为1
//保存后重启服务：
/etc/init.d/ssh restart
```

这样，当服务器连续60秒没有接收到来自客户端的keep-alive包，如果客户端没有回应，会记录下来直到记录数超过 ClientAliveCountMax 的值时，就会关闭会话连接了。
