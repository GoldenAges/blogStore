<link rel="stylesheet" href="http://yandex.st/highlightjs/6.2/styles/googlecode.min.css">
 
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script src="http://yandex.st/highlightjs/6.2/highlight.min.js"></script>
 
<script>hljs.initHighlightingOnLoad();</script>
<script type="text/javascript">
 $(document).ready(function(){
      $("h2,h3,h4,h5,h6").each(function(i,item){
        var tag = $(item).get(0).localName;
        $(item).attr("id","wow"+i);
        $("#category").append('<a class="new'+tag+'" href="#wow'+i+'">'+$(this).text()+'</a></br>');
        $(".newh2").css("margin-left",0);
        $(".newh3").css("margin-left",20);
        $(".newh4").css("margin-left",40);
        $(".newh5").css("margin-left",60);
        $(".newh6").css("margin-left",80);
      });
 });
</script>
<div id="category"></div>

#Zealerk开发流程文档

**编写人**：王全军

**编写日期**：2014年7月26日

**Email**：wangquanjun@zealer.com


##文档说明
用于快速了解项目需求，工作流程，不定期更新，如有好的想发和建议，可用该文档相应的格式添加到内容中，并且在文档开始修订记录中填写修改人，以便核对信息。


###开发准备
**环境**：系统Linux、编辑器vim、语言php

**账号**：
	测试账号jiqiren1 
	密码 123456aa
	管理员账号需要申请

**开发机**：需要申请账号

**版本控制**：git
			
**域名**：请管理员分配端口供访问开发项目

###环境设置
####绑定线下开发环境

	172.16.1.202 inner.zealer.com www.inner.zealer.com ask.inner.zealer.com img.inner.zealer.com static.inner.zealer.com super.inner.zealer.com api.inner.zealer.com fix.inner.zealer.com mantis.zealer.com wiki.zealer.com fix.admin.inner.zealer.com super.inner.zealer.com plus.inner.zealer.com

####远程开发环境

	120.237.117.62 inner.zealer.com www.inner.zealer.com ask.inner.zealer.com img.inner.zealer.com static.inner.zealer.com super.inner.zealer.com api.inner.zealer.com fix.inner.zealer.com mantis.zealer.com wiki.zealer.com fix.admin.inner.zealer.com super.inner.zealer.com plus.inner.zealer.com
				
####登录开发机，账号为之前申请账号

####下载项目文件

在终端执行如下命令, 进入到用户的根目录：cd ~通过git下载项目源代码

	git clone ssh://git@120.237.117.62/zealer-com.git zealer.com

####配置项目环境

配置项目环境：`vim nginx/conf/vhost.conf`

将文件里的listen都改成分配的端口,如1030，退出并保存文件

####修改项目配置端口

vim zealer.com/wwwroot/protected/config/Zealer.php

####创建项目运行必备目录

进入项目目录

	cd zealer.com/wwwroot/protected/
	mkdir templates_c
	chmod –R 777 templates_c
	chmod –R 777 runtime

新建项目模板运行文件

	cd zealer.com/wwwroot/protected/
	mkdir output/ && cd output/ 
	mkdir widgets/ && mkdir pages/

新建静态资源目录

	cd ~/zealer.com/wwwroot/static/
	mkdir page/ && cd page/ 
	mkdir js/ && mkdir css/ && mkdir img/

到此环境设置完毕，通过访问之前绑定域名家分配的端口号
如
	
	inner.zealer.com:1030


###项目结构介绍
**文件目录介绍**

**Ps：在models中有以api为前缀命名的文件，此文件为api下数据库操作的验证文件.
components/LibBase.php里面放置全局调用静态方法。
Config/Zealer.php 全局常量定义文件，如做修改需通知管理员。**

**静态资源打包**
在主服务空间拷贝compressor.sh文件，此文件可放置于开发机根目录，该文件为前端代码打包生成脚本，如有需要改动前端模板文件时，改动之后需要运行打包脚本，不然模板改动无法生效。

###数据库
1. 数据库为mysql，在开发机上的登录可以直接使用登录脚本
```
	/home/pubsrv/mysql/Connect.sh
```

2. 数据库建表必须添加字段注释，所有字段尽量赋默认值，合理设置字段长度以及索引，字段命名为下划线式

###开发相关
####编写规则

php开发中，显示模板的Controller为前端编写，后端只写接受参数的 Controller

####参数传递

models的文件为传递参数，注意：如传递参数为数组时，需要在
models中使用CJSON::encode($data)将数据转化成json传递到api，     然后在api中使用CJSON::decode($data)将json转化成熟组以便正常使用。

####注释

在models中编写的function所有参数必须添加字段注释说明，详细请看 	项目代码

####语法

语法相关，真个项目的代码编写必须按照规定的语法规则，如变量命名为
       驼峰式，项目中有之前存在的下划线命名的变量，后期做修改.

####字段说明

在models中编写的function所有参数必须添加字段注释说明，详细请看 	项目代码，api同注。

###GIT常规操作
####初始化本地git目录

语法: `git init`
				
作用:通过该命令将当前目录设置成git管理库

####添加新文件到本地GIT库

语法: `git add /dir/ `

作用:通过此命令可将文件或者目录添加到本地git管理库

####查看本地git库所有文件状态

语法:`git status`

作用:查看所有文件的操作状态

####提交文件到本地git库

语法:`git commit /dir/ -m ‘文件备注’ `

作用:将本地可操作文件提交到本地git库


####提交本地git库到远程git管理库

语法:`git push origin branch`
			 
作用:将本地git管理库提及到远程的git管理库

**备注:branch为当前所在的分支**

####获取远程git管理库文件

语法:`git pull origin branch `
 
作用:获取元辰git管理库文件合并到本地git库

**备注:branch为当前所在分支**

####切换git管理库分支

语法:`git checkout branch`

作用:将本地git库切换到指定分支库

备注:branch为指定分支

####覆盖本地git管理库文件


语法:`git checkout /dir/`

作用: 用远程git管理库的文件强制覆盖本地git管理库文件

备注: 需要指定文件目录, ./或者指定文件目录


####查看文件详细修改内容

语法:git diff /dir/

作用: 查看所有详细的文件修改信息
				
备注: 查看全部修改信息不需要指定详细文件目录

####查看提交日志

语法:`git log`
作用: 查看所有本地提交到原仓库的记录

###VIM常规操作
####快捷键
* dd删除一行
* p粘贴一行一行
* gg回到文件开头
* GG回到文件的结尾
* shift+g回到文件结尾
* /XXXX:向下查找xxx
* ？xxxx  :向上查找
* :tabe XXXXX/  新建标签
* gt :切换标签

####vim配置文件
打开配置文件

```
	sudo vim  .vimrc
```
一些常用配置	
     
 ```
    set autoindent   "自动缩
    set backspace=2         "随时用退格键删除
    set nu          "显示每行的行号
    syntax on       "语法效验
    set laststatus=2    "总是显示状态栏
    set tabstop=4           "TAB 设置4个空格
    set softtabstop=4
    set shiftwidth=4        "设置缩进的空格数为4
    highlight StatusLine cterm=bold ctermfg=red ctermbg=black
          set ruler
          set showcmd
          set langmenu=zh_CN.UTF-8
          set autowrite   ""自动保存
          set tabstop=4   ""tab键的宽度为4
```
		
####设置新文件注释项：

```
 autocmd BufNewFile *.php exec ":call SetTitle()"
           func SetTitle()
            if &filetype=='php'
              call append(line("."),"<?php")
              call append(line(".")+1," /**")
              call append(line(".")+2,"  *@File Name:".expand("%"))
              call append(line(".")+3,"  *@Author:chenzhenghao")
              call append(line(".")+4,"  *@ xxxx")
              call append(line(".")+5,"  *@date ".strftime("%c"))
              call append(line(".")+6,"  */")
            endif
         autocmd BufNewFile * mormal G
         endfunc
 ```
###建立快捷登陆开发机配置文件

(本机终端新建：.home.sh)，添加以下代码：

```
       #! /bin/sh
   ssh chenzhenghao@120.237.117.62
```
登录时在终端输入：`sh .home.sh`
###OUTLOOK邮箱配置

   outlook for mac 添加用户的初始界面如如：
点击“添加用户”（如上图）：

在弹出的界面中点选“添加账户”（如上图），如果没有出现类似上图的界面：

则点击主界面的“工具”—>“账户”进行添加：

分别在对应的方框中填写相应的内容，其中接收服务器填写pop.qiye.163.com,发送服务器填写smtp.qiye.163.com,两处都勾选使用SSL连接，端口号会自动填充

##Mac 常用快捷键

Command + x 剪切
Command + c 复制
Command + v 粘贴
Command + z 撤销
Command + a 全选
Command + s 保存
Command + r 刷新

Fn ＋ 上箭头  上滚动一页
Fn ＋ 下箭头  下滚动一页
Fn ＋ 左箭头  滚动到开头
Fn ＋ 右箭头  滚动到末尾

Command + shift + c 打开电脑窗口 //F12
Command + 空格键  切换输入法
双指滚动触摸板   页面上下滚动
control＋ command + a 截屏

声明
以上为个人整理部分，如有遗漏或不解之处可以及时反馈，谢谢！

**注意**：以上内容属于公司技术部开发资料，部分资料涉及网站系统信息，属于公司机密，严禁通过各种方式向外部流传，谨记仅供内部查阅和修改！





