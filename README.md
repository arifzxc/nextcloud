# Nextcloud
<b>Nextcloud itu apa?</b>

Nextcloud adalah perangkat lunak peladen klien untuk membuat dan menggunakan layanan hos berkas.

NextCloud membantu Anda untuk memperoleh: rumah yang aman untuk semua data Anda. Amankan, di bawah kendali Anda dan kembangkan secara terbuka, transparan, dan dapat dipercaya.

Nextcloud menawarkan sinkronisasi file lokal dan teknologi kolaborasi online terkemuka di industri. Keahlian kami dalam menggabungkan kenyamanan dan kemudahan penggunaan solusi tingkat konsumen seperti Dropbox dan Google Drive dengan keamanan, privasi, dan kebutuhan kontrol bisnis.

Solusi mandiri kami memastikan Anda tahu di mana data berada, siapa yang memiliki akses, dan bahkan meta-data tidak bocor.

# DISINI SAYA MEMPUNYAI 2 PILIHAN PENGINSTALLAN

<b><h2> 1. Instalasi dengan shell script (.sh) instalasi jadi lebih mudah dan auto selesai dengan sendirinya. </b></h2>
   
<b><h3> Cara menjalankannya: </b></h3>

<b>Disarankan masuk sebagai superuser (root) terlebih dahulu, agar mempermudah ketika proses penginstalan.

Dengan perintah: </b>
```
sudo su
```
atau
```
su
```
install git terlebih dahulu (jika belum install):
```
apt install git
```
Download atau clone repo gitnya terlebih dahulu:
```
git clone https://github.com/arifzxc/nextcloud
```
masuk ke dalam directory terlebih dahulu:
```
cd nextcloud/bashshell/
```
Menjalankan shell script untuk linux ubuntu:
```
sh linuxubuntu.sh
```
Menjalankan shell script untuk linux debian:
```
sh linuxdebian.sh
```

<b><h2> 2. Dengan command line copy paste manual, silahkan ikuti perintah dibawah ini. </b></h2>

<b><h3> Download extension yang dibutuhkan (minimal menggunakan php versi 7.3 keatas) </b></h3>

Linux Ubuntu, biasanya menggunakan mysql:
```
sudo apt install apache2 php php-xmlrpc php-mysql php-gd php-cli php-curl \
mysql-client mysql-server libphp-adodb libgd-dev php-pear \
php-common libapache2-mod-php php-fpm \
php-bz2 php-xml imagemagick php-zip php-mbstring -y

```

Linux Debian, biasanya menggunakan mariadb:
```
sudo apt install apache2 php php-xmlrpc php-mysql php-gd php-cli php-curl \
mariadb-client mariadb-server libphp-adodb libgd-dev php-pear \
php-common libapache2-mod-php php-fpm \
php-bz2 php-xml imagemagick php-zip php-mbstring -y

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
Masuk ke directory web server:
```
cd /var/www/html/
```
Unzip file latest.zip:
```
unzip latest.zip
```
Kasih permission ke foldernya:
```
chmod -R 755 nextcloud/
chown -R www-data:www-data nextcloud/
```
restart apache2:
```
/etc/init.d/apache2 restart
```
atau 
```
sudo systemctl restart apache2.service
```
# MENGUBAH KECEPATAN UPLOAD, DLL. UNTUK WEB SERVER APACHE2 AGAR LEBIH STABIL
Silahkan sesuaikan dengan versi php yang sudah diinstall<br>
untuk cek versi php, bisa menggunakan perintah:
```
php -v
php --version
````
edit menggunakan perintah:
```
sudo vi /etc/php/7.3/apache2/php.ini
sudo vi /etc/php/7.4/apache2/php.ini
```
atau
```
sudo nano /etc/php/7.3/apache2/php.ini
sudo nano /etc/php/7.4/apache2/php.ini
```

cari text dan ubah sesuai dengan contoh dibawah ini:
```
upload_max_filesize = 100M
post_max_size = 48M
memory_limit = 512M
max_execution_time = 600
max_input_vars = 3000
max_input_time = 1000
```

# MENGATUR DATABASE

Setup root password<br>
copy perintah dibawah ini dan paste dinotepade dahulu, edit kata yang ada didalam kurung ini <b>('password')</b> dengan password yang ingin kalian bikin, kemudian copy semua perintah yang tadi sudah diubah passwordnya, dan paste diterminal linux.
```
mysql
SET PASSWORD FOR root@localhost=PASSWORD('password');
exit
```
Selanjutnya... <br>
Masuk mysql dengan perintah dibawah ini, kemudian masukan password yang barusan dibuat diatas:
```
mysql -u root -p
```
Bikin databasenya, masukan seperti dibawah ini:
```
create database nextcloud;
ALTER DATABASE nextcloud charset=utf8mb4;
ALTER DATABASE nextcloud CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
grant INSERT,SELECT on root.* to nextcloud@localhost;
grant CREATE, INSERT, SELECT, DELETE, UPDATE on nextcloud.* to nextcloud@localhost identified by "nextcloudpassword";
grant CREATE, INSERT, SELECT, DELETE, UPDATE on nextcloud.* to nextcloud identified by "nextcloudpassword";
exit

```
Restart linux ubuntu (mysql):
```
/etc/init.d/mysql restart
```
Restart linux debian (mariadb):
```
/etc/init.d/mariadb restart
```

# MENGAKSES & PROSES INSTALASI TERAKHIR NEXTCLOUD DIBROWSER

Bisa diakses menggunakan ip address yang didapat oleh device yang digunakan untuk install nextcloud.

Cek ip address menggunakan:
```
ifconfig
```
atau di linux debian menggunakan salah satu dibawah ini:
```
/sbin/ifconfig
/usr/sbin/ifconfig
```

Contoh hasil ifconfig:
```
eth0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether de:31:23:0d:b1:e3  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 22  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 19  bytes 1644 (1.6 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 19  bytes 1644 (1.6 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.73  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::e735:89f:f9c2:87d9  prefixlen 64  scopeid 0x20<link>
        ether 04:95:73:ba:4c:9b  txqueuelen 1000  (Ethernet)
        RX packets 37452  bytes 359654791 (342.9 MiB)
        RX errors 0  dropped 174  overruns 0  frame 0
        TX packets 15731  bytes 8735213 (8.3 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
Berhubung saya menggunakan akses jaringan menggunakan Wifi, bisa dilihat di <b>wlan0</b><br>
Ip address yang didapat oleh device adalah: <b>192.168.1.73</b> maka untuk mengaksesnya dengan cara membuka browser dan mengetikan ip yang didapat, contoh dibawah ini:
```
192.168.1.73/nextcloud
```

# MENGISI DATA

Contoh cara pengisian untuk membuat user akun baru sebagai admin (mengakses penuh dilayanan nextcloud).<br>
username dan password disesuaikan sendiri ya... <br>
Create an admin account: 
```
Username: admin
Password: admin123
```

<b> Untuk Data folder biarkan saja (default) </b>


Untuk database isikan sesuai dengan yang tadi dibikin, ini contoh kalo menggunakan database yang saya bikin diatas.<br>
Jika merubah database sendiri untuk nama, dll. Tinggal sesuaikan saja sama database yang sudah dibikin sendiri.
```
Database user: root
Database password: nextcloudpassword
Database name: nextcloud
localhost (default)
```

   
Jika sudah mengisi data semua, selanjutnya klik <b>Finish setup</b>, tunggu hinggga proses selesai. Nanti akan otomatis dialihkan ke halaman menu utama nextcloud.

<br>
<b>Selesai, semoga bermanfaat tutorial installasi nextcloud yang sudah saya bikin.<br>
Mohon maaf jika ada kata-kata yang kurang nyambung atau lainnya.<br>
Terima Kasih...</b>

