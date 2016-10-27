#!/usr/bin/env bash

# Add vg hostname
cp /var/www/vagrant_bootstrap/vg.local.conf /etc/apache2/sites-available/
cd /etc/apache2/sites-enabled
ln -s /etc/apache2/sites-available/vg.local.conf .

# Add the hostname to hosts file
echo "127.0.1.1 vg.local www.vg.local" >> /etc/hosts

# Copy SSH keys inside the machine
cd /var/www/ssh
cp id_rsa id_rsa.pub /home/vagrant/.ssh/ -vv
cd /home/vagrant/.ssh/
chmod 0600 id_rsa -vv
chmod 0755 id_rsa.pub -vv
cat id_rsa.pub >> authorized_keys
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

# Update repositories
apt-get update

