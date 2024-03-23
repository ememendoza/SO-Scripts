#!/bin/bash
export apt_source_list='/etc/apt/sources.list';
#URL donde se encuentra el repositorio debian
export repositorio_debian='deb http://http.us.debian.org/debian bookworm main contrib non-free non-free-firmware';
#URL donde se encuentra el repositorio debian security
export repositorio_security='deb http://security.debian.org/ bookworm-security main contrib non-free non-free-firmware';

#Debian
echo "";
echo "..: CONFIGURANDO REPOSITORIOS DEBIAN Y DEBIAN SECURITY:..";
echo "";
echo $repositorio_debian > $apt_source_list;
echo $repositorio_security >> $apt_source_list;

echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;

echo "";
echo "..: ACTUALIZACION DE DISTRIBUCION :..";
echo "";
apt-get -y upgrade;

echo "";
echo "..: INSTALACION BASICA DE PAQUETES :..";
echo "";
apt-get -y install bc cpio bzip2 unzip zip p7zip-full unace cabextract arj rar unrar zstd ncompress lzma unp unalz mscompress kgb unshield nomarch dvd+rw-tools genisoimage secure-delete wodim wipe cdrdao vcdimager openssh-client openssh-server links2 nmap vim less screen htop dnsutils ntpdate ntp desktop-base manpages-es telnet build-essential module-assistant linux-headers-amd64 grub2 bash-completion chkrootkit dmidecode lshw pciutils procinfo usbutils read-edid hwinfo x86info cpuid parted testdisk quota quotatool libaio1 net-tools ethtool tcpdump sysstat firmware-linux firmware-linux-nonfree firmware-linux-free iftop traceroute tcptraceroute wget hdparm lm-sensors rsync speedtest-cli ethtool etherwake gdisk;

echo "";
echo "..: REMOVIENDO PAQUETES INECESARIOS :..";
echo "";
apt -y autoremove;

echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;

echo "";
echo "..: ACTUALIZACION DE DISTRIBUCION :..";
echo "";
apt-get -y upgrade;

echo "";
echo "..: INSTALACION DE APACHE :..";
echo "";
apt-get -y install apache2 openssl php8.2 libapache2-mod-php8.2 php-pear php8.2-cgi php8.2-cli php8.2-dev php8.2-common php8.2-curl php-apcu php-fpdf php8.2-intl php8.2-gd php8.2-imap php8.2-ldap php8.2-mysql php8.2-odbc php8.2-pgsql php-soap php8.2-sqlite3 php8.2-cgi php-imagick php-mbstring php-cas php8.2-bz2 php8.2-zip php8.2-bcmath php8.2-xml php8.2-gmp;

echo "";
echo "..: CONFIGURACION MODULOS DE APACHE :..";
echo "";
a2enmod alias dir php8.2 userdir rewrite ssl headers;
/etc/init.d/apache2 stop; /etc/init.d/apache2 start;