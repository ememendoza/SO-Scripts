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
apt-get -y install bc cpio bzip2 unzip zip p7zip-full unace cabextract arj rar unrar zstd ncompress lzma unp unalz mscompress kgb unshield nomarch dvd+rw-tools genisoimage secure-delete wodim wipe cdrdao vcdimager openssh-client openssh-server links2 nmap vim less screen htop dnsutils ntpdate ntp desktop-base manpages-es telnet build-essential module-assistant linux-headers-amd64 grub2 bash-completion chkrootkit dmidecode lshw pciutils procinfo usbutils read-edid hwinfo x86info cpuid parted testdisk quota quotatool libaio1 net-tools ethtool tcpdump sysstat firmware-linux firmware-linux-nonfree firmware-linux-free iftop traceroute tcptraceroute wget hdparm lm-sensors hddtemp rsync speedtest-cli ethtool etherwake gdisk;

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
echo "..: INSTALACION DE MYSQL :..";
echo "";
apt-get -y install mariadb-server mariadb-client;

grant all privileges on *.* to 'root'@'localhost' identified by 'AMDfx852048xTDKnrw';
grant all privileges on *.* to 'root'@'%' identified by 'AMDfx852048xTDKnrw';
