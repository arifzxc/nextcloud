# nextcloud
Install Nextcloud Armbian

# Disini saya mempunyai 2 pilihan
# 1. Instalasi dengan bash shell (.sh) instalasi jadi lebih mudah dan
   auto selesai dengan sendirinya.
   
Cara menjalankannya:
install git terlebih dahulu (jika belum install):
```
sudo apt install git
```
Download atau clone repo gitnya terlebih dahulu:
```
git clone https://github.com/arifzxc/nextcloud
```
masuk ke dalam directory terlebih dahulu:
```
cd nextcloud/bashshell/
```
Menjalankan bash shell untuk linux ubuntu:
```
sh linuxubuntu.sh
```
atau
```
./linuxubuntu.sh
```
Menjalankan bash shell untuk linux debian:
```
sh linuxdebian.sh
```
atau
```
./linuxdebian.sh
```

# 2. Dengan command line, silahkan ikuti perintah dibawah ini 

<b> Download extension yang dibutuhkan (minimal menggunakan php versi 7.4 keatas) </b>
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

Download File Nextcloud
```
wget https://download.nextcloud.com/server/releases/latest.zip
```
Copy file yang sudah di download ke /var/www/html/
contoh :
```
cp latest.zip /var/www/html/
```
Unzip file latest.zip :
```
unzip latest.zip
```
Kasih permission ke foldernya :
```
chmod -R 755 nextcloud/
chown -R www-data:www-data nextcloud/
```
restart apache2 :
```
/etc/init.d/apache2 restart
```
atau 
```
sudo systemctl restart apache2.service
```

Selesai, tinggal akses ke web lokal dan isi data yang dibutuhkan.
Bisa diakses menggunakan ip address yang didapat oleh device yang digunakan untuk install nextcloud.
Contoh menggunakan ip address lokal:
```
192.168.1.72/nextcloud
```
