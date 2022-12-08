# Masuk sebagai superuser (root) terlebih dahulu, agar mempermudah proses instalasi.                           

wget https://download.nextcloud.com/server/releases/latest.zip

sudo apt install apache2 unzip ntfs-3g php php-xmlrpc php-mysql php-gd php-cli php-curl \
mysql-client mysql-server libphp-adodb libgd-dev php-pear \
php-common libapache2-mod-php php-fpm \
php-bz2 php-xml imagemagick php-zip php-mbstring  -y

cp latest.zip /var/www/html/
cd /var/www/html/
unzip latest.zip

chmod -Rf 755 nextcloud/
chown -Rf www-data:www-data nextcloud/

sudo systemctl restart apache2.service 
sudo systemctl restart mysql.service


