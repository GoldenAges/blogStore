[v2ex上的git结点](https://www.v2ex.com/go/git?p=1)
[Git Pro](git-scm.com/book/zh/v1/起步-Git-简史)

#Git的基础配置
+ 安装完后设置用户名，邮箱
    * git config --global user.name "Rich"
    * git config --global user.email xxx@gmail.com
    * git config --global core.editor "'c:/user/sublime text 2.exe' -w"
    * git config --global color.ui true
    * git config --global core.autocrlf false //换行符，crlf为windows下，lf为Linux下


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
* 提交到缓存区 git -commit -m "message" （撤销操作票见后文）
* 将服务器的拉取到本地 git pull origin master(当前分支)
* 提交到服务器 git push origin master(当前分支)
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
    
参考[Git远程操作详解](http://www.ruanyifeng.com/blog/2014/06/git_remote.html)
    

#Git 常见warnings,errors及原因

###checkout的时候
    Git - fatal: Unable to create '/path/my_project/.git/index.lock': File exists.
解决方案：`rm -f ./.git/index.lock`
参考资料：[stack参考](http://stackoverflow.com/questions/7860751/git-fatal-unable-to-create-path-my-project-git-index-lock-file-exists)

###add的时候
    $ git add -A
    warning: LF will be replaced by CRLF in wp-content/themes/talisker-v2/page-
    p_html.php
    The file will have its original line endings in your working directory.

原因：不同平台的换行符不同，不是什么问题。建议在sublime下使用配置

    "default_line_ending": "unix",  
    "trim_trailing_white_space_on_save": true,
    "ensure_newline_at_eof_on_save": true,
-----
###commit的时候

    You have not concluded your merge (MERGE_HEAD exists).
    Please, commit your changes before you can merge.

The problem is your previous pull failed to merge automatically and went to conflict state. And the conflict wasn't resolved properly before the next pull.

1) Undo the merge and pull again.
To undo a merge:
`git merge --abort [Since git version 1.7.4]`
`git reset --merge [prior git versions]`
2) Resolve the conflict.
3) Don't forget to add and commit the merge.
4) git pull now should work fine.

[stack 参考](http://stackoverflow.com/questions/11646107/you-have-not-concluded-your-merge-merge-head-exists)   

------------

###push的时候

    $ git push origin master
    To john@githost:simplegit.git
    ! [rejected] master -> master (non-fast forward)
    error: failed to push some refs to 'john@githost:simplegit.git'
    

原因：Git 则必须先在本地合并后才能推送，所以push前先需要`Git fetch`,但是为什么还是不行呢？虽然你下载了最新的，但是由于只是服务器origin/master指向最新的,你的版本master指向你的上次commit，两者的指向不同。先需要合并最新的。
解决方案：`git merge origin/master`,当你直接在master分支的时候，可以`git pull`，他相当于`git fetch + git merge`
[官方文档](http://git-scm.com/book/zh-tw/v1/%E5%88%86%E6%95%A3%E5%BC%8F-Git-%E7%82%BA%E5%B0%88%E6%A1%88%E4%BD%9C%E8%B2%A2%E7%8D%BB)


###conflict的时候

    $ git status
    On branch master
    You have unmerged paths.
    (fix conflicts and run "git commit")
    Unmerged paths:
    (use "git add <file>..." to mark resolution)
    both modified:      index.html
    no changes added to commit (use "git add" and/or "git commit -a")
    

解决方案：查看发生冲突的文件，手动修改后commit，通过 `git mergetool` 可以看到图形化的界面，便于直观的理解
原因：见上面conflict的原因

[官方参考:3.2 Git 分支 - 分支的新建與合併](http://git-scm.com/book/zh-tw/v1/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E7%9A%84%E6%96%B0%E5%BB%BA%E8%88%87%E5%90%88%E4%BD%B5)


----
###

     ! [rejected]        master -> master (non-fast-forward)
    error: failed to push some refs to 'git@github.com:519ebayproject/519ebayproject.git'
    hint: Updates were rejected because the tip of your current branch is behind
    hint: its remote counterpart. Merge the remote changes (e.g. 'git pull')
    hint: before pushing again.
    hint: See the 'Note about fast-forwards' in 'git push --help' for details.

原因：Git requires that you handle merges yourself because a merge may lead to conflicts.
解决方案：取消合并 `git commit --abort`,解决conflict,再去push
[stack参考](http://stackoverflow.com/questions/10298291/cannot-push-to-github-keeps-saying-need-merge)



#Git不常用但有必要了解的操作

###恢复被删除的文件(没有add)

    git checkout - <file name>

多个文件同时操作可以使用xargs

    git ls-fies -d | xargs git checkout --

原理：git checkout其实是用版本库里的版本替换工作区的版本，无论工作区是修改还是删除，都可以“一键还原”。

###撤销操作

撤销commit

    $ git log //查看最近提交日志
    $ git reset HEAD
修改commit

    $ git commit --amend

撤销add

    $ git reset HEAD
    $ git clean -xdf

撤销未add的文件

    $ git checout -f

##删除远程文件，保留本地

`git rm --cached -r somedir` will stage the deletion of the directory, but doesn't touch anything on disk.

You should then add somedir/ to your .gitignore file so that git doesn't try and add it back.

[stackoverflow参考](http://stackoverflow.com/questions/3469741/remove-file-from-the-repository-but-keep-it-locally)

##删除本地，保留远程
    删除本地文件，将本地文件添加到 .gitignore

####查看某个文件的更改记录
    git blame filename #git blame wp-config.php
