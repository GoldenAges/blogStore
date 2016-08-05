## git 进阶操作

#Git不常用但有必要了解的操作

###恢复被删除的文件(没有add)

    git checkout - <file name>

多个文件同时操作可以使用xargs

    git ls-fies -d | xargs git checkout --

原理：git checkout其实是用版本库里的版本替换工作区的版本，无论工作区是修改还是删除，都可以“一键还原”。

###git diff
git diff 只能查看未 add 的内容和原始文件的差异
git diff --cached 可以查看add之后的内同和文件的差异

###撤销操作

####撤销commit
    
    $ git rm --cached //撤销最近一次commit（还没有push上服务器）

    $ git reset file_name //撤销特定的文件

    $ git log //查看最近提交日志
    $ git reset HEAD~2 //回退到两次commit之前（可以针对push到服务器上的commit）

修改commit(比如忘记提交某文件了，add之后可以使用这个命令)

    $ git commit --amend forget_file_name

####撤销add

    $ git reset HEAD
    $ git clean -xdf

####撤销未add的文件

    $ git checout -f

##删除远程文件，保留本地

`git rm --cached -r somedir` will stage the deletion of the directory, but doesn't touch anything on disk.

You should then add somedir/ to your .gitignore file so that git doesn't try and add it back.

[stackoverflow参考](http://stackoverflow.com/questions/3469741/remove-file-from-the-repository-but-keep-it-locally)

##删除本地，保留远程
    删除本地文件，将本地文件添加到 .gitignore

####查看某个文件的更改记录
    git blame filename #git blame wp-config.php

Your new feature isn't worth the time and you're going to delete it. But it has one commit that fills in `README` file, and you want this commit to be on the master as well

1. `git log` 查找到那次commit
2. git cherry-pick commit


###修改任意commit
1. 查找到commit 假设为aaabbbb
2. git rebase -i aaabbb
3. 修改 'pick' 为 'edit'
4. git rebase --contiue

###合并commit
1. git rebase -i aaabb 
2. 查看rebase 选项
    
    pick：正常选中
    reword：选中，并且修改提交信息；
    edit：选中，rebase时会暂停，允许你修改这个commit（参考这里）
    squash：选中，会将当前commit与上一个commit合并
    fixup：与squash相同，但不会保存当前commit的提交信息
    exec：执行其他shell命令
3. 根据需要选择

1. 一种简单的方法 git reset --hard HEAD^5, 重新提交

###合并某个分支的所有commit到master分支
1. `git merge --squash` long-feature-branch

###重新排列order顺序
1. git rebase -i aaabbb
2. 在编辑页面更改commit顺序

###二分法查找bad commit
[使用git来调试程序](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E4%BD%BF%E7%94%A8-Git-%E8%B0%83%E8%AF%95)

###仅仅提交一个文件的部分修改
`git add -e` //可edit add信息

###查看一些历史操作
git reflog

###git 重命名

    git mv old_name new_name

相当于系统的三条命令

    $ mv README.md README
    $ git rm README.md
    $ git add README





