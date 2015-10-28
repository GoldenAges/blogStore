title: git workflow
date: 2015-10-04 23:42:48
tags:
- Git 
- Workflow
---
三种常见的工作流
克隆本地

    git clone project

1.正常的工作流

* 添加一个新功能，添加到跟踪区 git -add file（撤销操作见后文）
* 提交到缓存区 git -commit -m "message" （撤销操作票见后文）
* 将服务器的拉取到本地 git pull origin master(当前分支)
* 提交到服务器 git push origin master(当前分支)
* 提交报错 conflict, 本地解决冲突后再次提交
2.开发新功能
3.分支与合并(rebase)

