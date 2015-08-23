[ss服务器安装](https://github.com/shadowsocks/shadowsocks)

ubuntu:
`apt-get install python-pip`
`pip install shadowsocks`

    cd /etc/
    vi ss.json
    {
        "server":"128.199.216.140",
        "server_port":8388,
        "local_address": "127.0.0.1",
        "local_port":1080,
        "password":"helloworld",
        "timeout":300,
        "method":"rc4-md5",
        "fast_open": false
    }
    "server":"45.55.11.194",

后台运行
`ssserver -c ss.json -d start`
开机自启动
`vi /etc/rc.local`
`ssserver -c /etc/ss.json -d start`

[shadowsocks客户端配置]()

[shadowsocks服务器脚本]()



