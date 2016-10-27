#!/usr/bin/env bash

# PHP tools
apt-get install -y php5-xdebug php5-xmlrpc

echo "; // Xdebug : We use minimal configuration and the browser and the IDE should detect the connection automatically
xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.remote_autostart=1
//xdebug.remote_port=10000
//xdebug.remote_log=/tmp/xdebug-remote.log
//xdebug.idekey = PHPSTORM >> /etc/php5/mods-available/xdebug.ini

# Finally, restart apache
service apache2 restart