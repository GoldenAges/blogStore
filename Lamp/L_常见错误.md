`start: Rejected send message, 1 matched rules; type="method_call", sender=":1.23" (uid=1000 pid=14767 comm="start ssh ") interface="com.ubuntu.Upstart0_6.Job" member="Start" error name="(unset)" requested_reply="0" destination="com.ubuntu.Upstart" (uid=0 pid=1 comm="/sbin/init ")`
参考：http://askubuntu.com/questions/522375/rejected-send-message-1-matched-rules-type-method-call-sender-1-5-whil
重点：uid=1000 说明是第一个非系统用户，root 的 uid 是0
原因：重启服务需要root权限

