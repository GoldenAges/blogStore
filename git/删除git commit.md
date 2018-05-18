删除 Git commit 的两种方法

[参考](https://www.clock.co.uk/insight/deleting-a-git-commit)

假设日志文件为：
![20170814150269903338488.png](http://7xscq6.com1.z0.glb.clouddn.com/20170814150269903338488.png)

大致原理为：
新建一个reset分支，cherry

1. 删除一个或多个连续的commit rebase

2. 删除不连续的commit, Cherry Pick
* git checkout b3d92c5 Checkout the last usable commit.
* git checkout -b repair Create a new branch to work on.
* git cherry-pick 77b9b82 Run through commit 3.
* git cherry-pick 2c6a45b Run through commit 1.
* git checkout master Checkout master.
* git reset --hard b3d92c5 Reset master to last usable commit.
* git merge repair Merge our new branch onto master.
* git push --hard origin master Push master to the remote repo.