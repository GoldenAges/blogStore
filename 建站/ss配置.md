

ubuntu:
`apt-get install python-pip`
`pip install shadowsocks`

    cd /etc/
    vi ss.json
    {
        "server":"*.*.*.*",
        "server_port":8388,
        "local_address": "127.0.0.1",
        "local_port":1080,
        "password":"your_password",
        "timeout":300,
        "method":"rc4-md5",
        "fast_open": false
    }

后台运行

    ssserver -c ss.json -d start
开机自启动

    vi /etc/rc.local
添加以下内同到 exit 0 之前.

    ssserver -c /etc/ss.json -d start

参考：

1. [ss服务器安装](https://github.com/shadowsocks/shadowsocks)
2. [锐速支持列表](https://my.serverspeeder.com/ls.do?m=availables)



