通过 php -v可以查看php的版本，如何升级？
http://askubuntu.com/questions/565784/how-to-upgrade-php-version-to-the-latest-stable-released-version-lets-say-how
调用系统的包管理命令来升级
`sudo apt-get update`
`sudo apt-get upgrade`
如果还是显示旧版本，那可能是没有添加 [php5 PPA](https://launchpad.net/~ondrej/+archive/ubuntu/php5)

Run the following to add the PPA:

For PHP 5.4:

sudo apt-add-repository ppa:ondrej/php5-oldstable
For PHP 5.5:

sudo apt-add-repository ppa:ondrej/php5
For PHP 5.6:

sudo apt-add-repository ppa:ondrej/php5-5.6
Then update the package lists and perform the upgrade:

sudo apt-get update
sudo apt-get install php5s
Now you should have the latest PHP version.

如果在使用命令`apt-add-repository` 报错，那么应该这样：
http://askubuntu.com/questions/493460/how-to-install-add-apt-repository-using-the-terminal
try these:

    sudo apt-get install software-properties-common
and/or

    sudo apt-get install python3-software-properties
and/or

    sudo apt-get install python-software-properties
