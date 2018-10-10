当MySQL导入过大数据而导致失败，而导致不能重启，甚至重启服务器后都不能重启，
会报这个错误

```
AVC apparmor="DENIED" operation="open" profile="/usr/sbin/mysqld" name="/proc/8133/status" pid=8133 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=110 ouid=110
```