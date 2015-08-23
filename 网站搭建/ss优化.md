
[shadowsocks优化方法](http://notes.xiamo.tk/2015-06-17-Digitalocean%E9%85%8D%E7%BD%AEshadowsocks%E6%9C%8D%E5%8A%A1%E5%99%A8-%E4%BC%98%E5%8C%96%E7%AC%94%E8%AE%B0.html)

`wget http://my.serverspeeder.com/d/ls/serverSpeederInstaller.tar.gz`    #获取锐速安装文件

`tar zxvf serverSpeederInstaller.tar.gz`      #解压

`bash serverSpeederInstaller.sh`      #执行安装脚本

`/serverspeeder/bin/serverSpeeder.sh start` #启动锐速

    vim  /serverspeeder/etc/config
    
    advinacc="1"
    maxmode="1"
    rsc="1"
    gso="1" #主要是针对Digitalocean，其他的VPS小伙伴就请自测啦
    accppp="1" #开启VPN加速~

    /serverspeeder/bin/serverSpeeder.sh restart #重启

    vi /etc/rc.local #自启动
    ssserver -c /etc/ss.json -d start
    /serverspeeder/bin/serverSpeeder.sh start

