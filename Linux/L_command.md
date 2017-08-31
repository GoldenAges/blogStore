##Initial
* `apt-get update`安装更新
* 基本软件配置
    - `apt-get install chromium-browser`
    - `apt-get install git`,接下来参考git配置
    - `apt-get install pip`
    - `curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh#配置vim,curl https://j.mp/spf13-vim3 -L -o - | sh#update`
    - `sudo pip install thefuck`,用于纠正命令的，在错误的命令前加上 fuck
    - 

##Ubuntu常用命令及参考
* 安装 apt-get install ""

* 查找文件 find&grep
* 删除文件
    


* 为显示器添加合适的分辨率
```
    #show screen config
    xrandr
    #generate new resolution
    sudo svt 1366 768 60
    #set resolution
    xrandr --addmode VGA-1 "1366x768"
```
****
`cd ~`表示进入当前用户目录（如果当前用户是root，则进入的是/root下，如果是apple，则进入/home/apple） 
***
显示支持的语言
`echo $LANG`
设置语言
`$LANG=en_EN`
***
日期，时间，计算器
```
date
cal
bc
scal=3#设置计算结果的精度
```

***

