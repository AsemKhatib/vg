#!/usr/bin/env bash

echo "Provisioning virtual machine ..."

# Add vg hostname
cp /var/www/vagrant_bootstrap/vg.local.conf /etc/apache2/sites-available/
cd /etc/apache2/sites-enabled
ln -s /etc/apache2/sites-available/vg.local.conf .

# Add the hostname to hosts file
echo "127.0.1.1 vg.local www.vg.local" >> /etc/hosts

# Copy SSH keys inside the machine
# ecd /var/www/ssh
# ecp id_rsa id_rsa.pub /home/vagrant/.ssh/ -vv
# ecd /home/vagrant/.ssh/
# echmod 0644 id_rsa -vv
# echmod 0755 id_rsa.pub -vv
# ecat id_rsa.pub >> authorized_keys
# eval "$(ssh-agent -s)"
# ssh-add id_rsa -vv

# Install toolchain
wget -nv -O/usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer -vv
wget -nv -O/usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && chmod +x /usr/local/bin/phpunit -vv
wget -nv -O/usr/local/bin/phpcpd https://phar.phpunit.de/phpcpd-2.0.4.phar && chmod +x /usr/local/bin/phpcpd -vv
wget -nv -O/usr/local/bin/phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && chmod +x /usr/local/bin/phpcs -vv
wget -nv -O/usr/local/bin/phploc https://phar.phpunit.de/phploc.phar && chmod +x /usr/local/bin/phploc -vv
wget -nv -O/usr/local/bin/pdepend http://static.pdepend.org/php/latest/pdepend.phar && chmod +x /usr/local/bin/pdepend -vv
wget -nv -O/usr/local/bin/phpmd http://static.phpmd.org/php/latest/phpmd.phar && chmod +x /usr/local/bin/phpmd -vv
wget -nv -O/usr/local/bin/phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && chmod +x /usr/local/bin/phpcs -vv
wget -nv -O/usr/local/bin/phpcbf https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar && chmod +x /usr/local/bin/phpcbf -vv

# Add ppa:ondrej/php package and delete the old one
# cd /etc/apt/sources.list.d && rm ondrej-php5-5_6-trusty.list && add-apt-repository -y ppa:ondrej/php

apt-get update
add-apt-repository ppa:ondrej/php
yes | sudo apt-get install php7.0
apt-get update
yes | sudo apt-get install php7.0-mysql libapache2-mod-php7.0
a2dismod php5
a2enmod php7.0
apachectl restart

# remove PHP5 and install the new php5.6 packageexit
# apt-get update && yes | sudo apt-get remove php5* && yes | sudo apt-get install php5.6

# Update repositories
apt-get update

# PHP tools
yes | sudo apt-get install php-xdebug php-xml

echo "xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.remote_autostart=1
//xdebug.remote_port=10000
//xdebug.remote_log=/tmp/xdebug-remote.log
//xdebug.idekey = PHPSTORM" >> /etc/php/7.0/mods-available/xdebug.ini

cp /var/www/vagrant_bootstrap/user.ini /etc/php/7.0/apache2/conf.d/ 

# Finally, restart apache
service apache2 restart





