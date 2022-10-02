# nextcloud
Install Nextcloud Armbian

Disini saya mempunyai 2 pilihan
1. Instalasi dengan bash shell (.sh) instalasi jadi lebih mudah dan
   auto selesai dengan sendirinya
Cara menjalankannya:
install git terlebih dahulu (jika belum install)
```
sudo apt install git
```
```
git clone https://github.com/arifzxc/nextcloud
```
masuk ke dalam directory terlebih dahulu
```
cd nextcloud/whithshell/
```
Menjalankan shell untuk linux ubuntu:
```
sh linuxubuntu.sh
```
atau
```
./linuxubuntu.sh
```
Menjalankan shell untuk linux debian:
```
sh linuxdebian.sh
```
atau
```
./linuxdebian.sh
```

2. Dengan command line, silahkan ikuti perintah dibawah ini 

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
