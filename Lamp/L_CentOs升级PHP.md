参考：
https://www.centos.org/forums/viewtopic.php?t=52586

CentOS/RHEL 7.x:

rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/web ... elease.rpm
CentOS/RHEL 6.x:

rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
Now you can install PHP 5.6 (along with an opcode cache) by doing:

yum install php56w php56w-opcache

Unless you know what you are doing, it is risky upgrading an existing system. It’s much safer to do this by provisioning a separate server to perform the upgrade as a fresh install instead.

If you know what you are doing, you can upgrade PHP by:

yum install yum-plugin-replace

yum replace --enablerepo=webtatic-testing php-common --replace-with=php56w-common
It will likely give you a message “WARNING: Unable to resolve all providers …”. This is normal, and you can continue by tying “y“. You will be given a chance to see what packages will be installed and removed before again being given a chance to confirm.