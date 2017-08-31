第二步：获取 VPS 之后，会得到 VPS 的 IP 地址和一个非常复杂的初始 root 密码。
OAH 需要先手动开启 TUN/TAP 和 PPP，按钮位于 Control Panel 底部的 Settings 选项卡中。
在 Windows 下使用 PuTTY，在 Linux 或者 OS X 下直接在 Terminal 中使用 SSH 命令登陆即可。登陆后使用 sudo passwd root 命令设置新密码，然后即可开始配置。

Step 1. 安装 PPTPD，命令如下：
Ubuntu：
apt-get install pptpd
CentOS：
rpm -i http://poptop.sourceforge.net/yum/stable/rhel6/pptp-release-current.noarch.rpm
yum -y install pptpd
注：如果失败，需要先 update 一下：
sudo apt-get update
sudo apt-get dist-upgrade

Step 2. 使用 vim（或其他文本编辑器如 Notepad++）打开 /etc/pptpd.conf 文件：
vim /etc/pptpd.conf
#localip 192.168.0.1
#remoteip 192.168.0.234-238,192.168.0.245
修改为：
localip 10.0.0.1
remoteip 10.0.0.100-200
按 Esc 键，输入“:wq”保存并退出 vim。

Step 3. 编辑 /etc/ppp/chap-secrets，添加 VPN 连接的用户名和密码。例，需要添加用户 Admin，密码为 administrator，与用户 Test，密码为 testing，则编辑后应当如下：
# Secrets for authentication using CHAP
# client server secret IP addresses
Admin pptpd administrator *
Test pptpd testing *

Step 4. 编辑 /etc/ppp/pptpd-options，指定 DNS Servers。找到如下两行：
#ms-dns 10.0.0.1
#ms-dns 10.0.0.2
修改为：
ms-dns 8.8.8.8
ms-dns 8.8.4.4
并键入以下命令，重启 PPTP 服务：
service pptpd restart

Step 5. 编辑 /etc/sysctl.conf，设置转发规则，设置 net.ipv4.ip_forward 的值：
net.ipv4.ip_forward = 1
并键入以下命令，使该改动生效：
sysctl -p

Step 6. 设置 iptables 的 NAT 规则。若 VPS 是 OpenVZ 的，则输入的命令为：
iptables -t nat -A POSTROUTING -o venet0 -j MASQUERADE
如果不是，则命令为：
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

第三步：到这里，服务器端的配置已经完成了。现在可在电脑或是手机等设备上，新建 PPTP 类型的 VPN 连接，输入 VPS 的 IP 地址以及之前配置的用户名和密码，即可连接自己的 VPN。当 VPS 重启后，需要重新进行第二步的 Step 6。如果拥有自己的域名，可以进行域名解析，将 http://vpn.yourdomain.com 指向 IP 地址，以便记忆。
出现问题时，例如无法连接，可以登陆主机，输入如下命令后，再次尝试连接，并查看错误信息：
tail -f /var/log/syslog | grep pptpd

出现一般的问题可尝试重启 PPTP 服务。
