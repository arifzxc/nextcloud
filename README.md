# nextcloud
Install Nextcloud Armbian

# Download extension yang dibutuhkan 
Linux Ubuntu, biasanya menggunakan mysql

```
sudo apt-get install apache2 php php-xmlrpc php-mysql php-gd php-cli php-curl \
mysql-client mysql-server libphp-adodb libgd-dev php-pear \
php-common libapache2-mod-php php-fpm \
php-bz2 php-xml imagemagick git php-zip php-mbstring  
```

Linux Debian, biasanya menggunakan mariadb
```
sudo apt-get install apache2 php php-xmlrpc php-mysql php-gd php-cli php-curl \
mariadb-client mariadb-server libphp-adodb libgd-dev php-pear \
php-common libapache2-mod-php php-fpm \
php-bz2 php-xml imagemagick git php-zip php-mbstring
```

# Download File Nextcloud
```
wget https://download.nextcloud.com/server/releases/latest.zip
```
Copy file yang sudah di download ke /var/www/html/
contoh:
```
cp latest.zip /var/www/html/
```
Unzip file latest.zip
```
unzip latest.zip
```
Kasih permission ke foldernya
```
chmod -R 755 nextcloud/
chown -R www-data:www-data nextcloud/
```

Selesai, tinggal akses ke web lokal dan isi data yang dibutuhkan.
Bisa diakses menggunakan ip address yang didapat oleh device yang digunakan untuk install nextcloud.
Contoh menggunakan ip address lokal:
```
192.168.1.72/nextcloud
```
