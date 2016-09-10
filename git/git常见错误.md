
# Git 常见warnings,errors以及一些情景操作

## 当你想要不保存本地所作改变，仅仅拉取remote commit时，可以使用 `git reset --hard HEAD`, 谨记，和 hard force 有关命令使用要慎重

http://stackoverflow.com/questions/101752/i-ran-into-a-merge-conflict-how-can-i-abort-the-merge

## 使本地改变设置为最新

http://stackoverflow.com/questions/52704/how-do-you-discard-unstaged-changes-in-git

Another quicker way is:

git stash save `--keep-index`
After that, you can drop that stash with a `git stash drop` command if you like.

http://stackoverflow.com/questions/7663451/view-a-specific-git-commit
Git show <revhash>


### checkout的时候
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



