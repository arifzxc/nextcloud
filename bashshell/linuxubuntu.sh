# Masuk sebagai superuser (root) terlebih dahulu, agar mempermudah proses instalasi.                           

apt install apache2 php php-xmlrpc php-mysql php-gd php-cli php-curl \
mysql-client mysql-server libphp-adodb libgd-dev php-pear \
php-common libapache2-mod-php php-fpm \
php-bz2 php-xml imagemagick php-zip php-mbstring  -y &

wget https://download.nextcloud.com/server/releases/latest.zip &

cp latest.zip /var/www/html/

unzip latest.zip

chmod -R 755 nextcloud/
chown -R www-data:www-data nextcloud/

systemctl apache2.service restart


