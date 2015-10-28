[git-add-a-git-commit-in-one-command](http://stackoverflow.com/questions/4298960/git-add-a-git-commit-in-one-command)

    git config --global alias.a-c '!git add -A && git commit'

    git config --global alias.pp '!git pull origin master && git push'

    git config --global --unset alias.<your_alias> to unset the alias
