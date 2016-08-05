git rebase 和 git merge的区别
为什么要使用 git rebase
[Git 使用规范流程](http://www.ruanyifeng.com/blog/2015/08/git-use-process.html)
[Git 分支 - 分支的衍合](http://git-scm.com/book/zh/v1/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E7%9A%84%E8%A1%8D%E5%90%88)

Git Rebase 使用中最重要的一点就是不要对 push 到服务器上面的东西进行rebase，那可是灾难性的！！！详见上面的链接

Git Rebase使用场景
1. 你开发某个功能，commit了（但还没有push），这时你发现功能有 bug, 于是你做了修改，又进行了第二次commit，这时，你可以使用 rebase 将两次commit合并，因为你修改的都是同一个功能
2. 
