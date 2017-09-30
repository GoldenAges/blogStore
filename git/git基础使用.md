[v2ex上的git结点](https://www.v2ex.com/go/git?p=1)
[Git Pro](git-scm.com/book/zh/v1/起步-Git-简史)

#Git的基础配置
+ 安装完后设置用户名，邮箱
    * git config --global user.name "Rich"
    * git config --global user.email xxx@gmail.com
    * git config --global core.editor "'c:/user/sublime text 2.exe' -w"
    * git config --global color.ui true
    * git config --global core.autocrlf input  //换行符，crlf为windows下，lf为Linux下

    一、AutoCRLF
    #提交时转换为LF，检出时转换为CRLF
    git config --global core.autocrlf true   

    #提交时转换为LF，检出时不转换
    git config --global core.autocrlf input   

    #提交检出均不转换
    git config --global core.autocrlf false
    二、SafeCRLF

    #拒绝提交包含混合换行符的文件
    git config --global core.safecrlf true   

    #允许提交包含混合换行符的文件
    git config --global core.safecrlf false   

    #提交包含混合换行符的文件时给出警告
    git config --global core.safecrlf warn


##配置key
* 本地生成  `ssh-keygen` ,保存在C:/User/.ssh/id_rsa.pub
* 复制 id_rsa.pub 中的内容,粘贴到github的配置里面去
* 测试成功与否 `ssh -T git@github.com`, 如果成功会有一段警告，yes即可

+ gitignore 的一些写法以及例子

        # 此为注释 – 将被 Git 忽略
        # 忽略所有 .a 结尾的文件
        *.a
        # 但 lib.a 除外
        !lib.a
        # 仅仅忽略项目根目录下的 TODO 文件，不包括 subdir/TODO
        /TODO
        # 忽略 build/ 目录下的所有文件
        build/
        # 会忽略 doc/notes.txt 但不包括 doc/server/arch.txt
        doc/*.txt
        # ignore all .txt files in the doc/ directory
        doc/**/*.txt
        # 本地gitignore地址
        .git>info>exclude
        [参考](http://stackoverflow.com/questions/1753070/git-ignore-files-only-locally)
        Note, if you already have unstaged changes you must run the following after editing your ignore-patterns:
        git update-index --assume-unchanged [<file>...]


#一次完整的工作流
* git clone project
* 本地修改，添加到跟踪区 git -add file（撤销操作见后文）
* 提交到缓存区 git -commit -m "message" （撤销操见后文）
* 将服务器的拉取到本地 git pull origin master(当前分支)
* 提交到服务器 git push -u origin master(当前分支)
* 提交报错 conflict, 本地解决冲突后再次提交

#Git的一些疑问以及解答
+ git为什么会产生conflicts?
    * 文件冲突
    假设两个用户同时修改了同一个文件的同一块区域，user1已经提交了，user2再提交就会报错，这时候需要你手动解决冲突。
    * 树冲突
    和上面的情况类似，这次是由于文件的重命名导致的，可以使用 git --rm <file name>,然后再add后commit。

+ git fetch 和 git pull的区别
    * 实际上 git pull = git fetch + git merge
    更加细节性的内容详见：[git pull 和 git fetch 有什么区别？](https://ruby-china.org/topics/15729)

+ git中的 origin master 是什么意思
    * 其中origin是远程主机的名字，master是他的分支名，这是默认的，可以修改。使用`git remote -v` 查看所有远程主机，`git remote show <主机名>` 可以看到详细信息。
    