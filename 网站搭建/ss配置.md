[ss服务器安装](https://github.com/shadowsocks/shadowsocks)

ubuntu:
`apt-get install python-pip`
`pip install shadowsocks`


后台运行
`ssserver -c ss.conf -d start`
开机自启动
`vi /etc/rc.local`
`ssserver -c /etc/ss.json -d start`

[shadowsocks客户端配置]()


[shadowsocks服务器脚本]()



