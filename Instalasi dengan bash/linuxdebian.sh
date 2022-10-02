apt install apache2 php php-xmlrpc php-mysql php-gd php-cli php-curl \
mariadb-client mariadb-server libphp-adodb libgd-dev php-pear \
php-common libapache2-mod-php php-fpm \
php-bz2 php-xml imagemagick git php-zip php-mbstring -y &

wget https://download.nextcloud.com/server/releases/latest.zip &

cp latest.zip /var/www/html/

unzip latest.zip

chmod -R 755 nextcloud/
chown -R www-data:www-data nextcloud/

/etc/init.d/apache2 restart
