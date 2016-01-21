http://stackoverflow.com/questions/101752/i-ran-into-a-merge-conflict-how-can-i-abort-the-merge

当你想要不保存本地所作改变，仅仅拉取remote commit时，可是使用 `git reset --hard HEAD`, 谨记，和 hard force 有关命令使用要慎重

使本地改变设置为最新

http://stackoverflow.com/questions/52704/how-do-you-discard-unstaged-changes-in-git
Another quicker way is:

git stash save `--keep-index`
After that, you can drop that stash with a `git stash drop` command if you like.
