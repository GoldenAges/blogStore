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


