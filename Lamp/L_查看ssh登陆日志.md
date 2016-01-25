http://askubuntu.com/questions/640906/where-does-ubuntu-14-04-log-ssh-access-attempts
查看 ssh 登陆日志
`/var/log/auth.log`
查看暴力登陆的
`grep sshd.\*Failed /var/log/auth.log | less`

查看登陆失败的
`grep sshd.*Did /var/log/auth.log | less`
