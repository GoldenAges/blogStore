强行pull 操作


git fetch origin master
git reset --hard FETCH_HEAD
git clean -df 

https://stackoverflow.com/questions/9589814/how-do-i-force-git-pull-to-overwrite-everything-on-every-pull