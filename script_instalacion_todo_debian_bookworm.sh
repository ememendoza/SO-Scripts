#!/bin/bash
export apt_source_list='/etc/apt/sources.list';
#URL donde se encuentra el repositorio debian
export apt_source_list_d='/etc/apt/sources.list.d/';
#URL donde se encuentra el repositorio adicional de debian
export repositorio_debian='deb http://http.us.debian.org/debian bullseye main contrib non-free';
#URL donde se encuentra el repositorio debian security
export repositorio_security='deb http://security.debian.org/ bullseye-security main contrib non-free';
#URL donde se encuentra el repositorio debian multimedia.
export repositorio_debian_multimedia='deb http://deb-multimedia.org bullseye main non-free';
#URL donde se encuentra el repositorio Google Chrome.
export repositorio_google_chrome='deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main';
export key_repositorio_google_chrome='https://dl.google.com/linux/linux_signing_key.pub';
#URL donde se encuentra el repositorio Skype.
export repositorio_skype='deb [arch=amd64] https://repo.skype.com/deb stable main';
export key_repositorio_skype='https://repo.skype.com/data/SKYPE-GPG-KEY';
#URL donde se encuentra el repositorio Dropbox.
export repositorio_dropbox='https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.02.14_amd64.deb';
export key_repositorio_dropbox='';
#URL donde se encuentra el repositorio OwnCloud.
export repositorio_owncloud='deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Debian_10/ /';
export key_repositorio_owncloud='https://download.opensuse.org/repositories/isv:ownCloud:desktop/Debian_10/Release.key';
#URL donde se encuentra el repositorio NextCloud.
export repositorio_nextcloud='deb http://download.opensuse.org/repositories/home:/ivaradi/Debian_Testing/ /';
export key_repositorio_nextcloud='http://download.opensuse.org/repositories/home:/ivaradi/Debian_Testing/Release.key';
#URL donde se encuentra el repositorio Sublime Text.
export repositorio_sublimetext='deb https://download.sublimetext.com/ apt/stable/';
export key_repositorio_sublimetext='https://download.sublimetext.com/sublimehq-pub.gpg';
#URL donde se encuentra el repositorio VirtualBox.
export repositorio_virtualbox='deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian bullseye contrib';
export key_repositorio_virtualbox='wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg';
#URL donde se encuentra el repositorio AnyDesk.
export repositorio_anydesk='deb http://deb.anydesk.com/ all main';
export key_repositorio_anydesk='https://keys.anydesk.com/repos/DEB-GPG-KEY';
#URL donde se encuentra el repositorio TEAMS.
export repositorio_teams='deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main';
export key_repositorio_teams='https://packages.microsoft.com/keys/microsoft.asc';

clear;
echo "";
echo "..: ELIMINANDO PAQUETES DESCARGADOS :..";
echo "";
apt-get clean all;

#Debian
clear;
echo "";
echo "..: CONFIGURANDO REPOSITORIOS DEBIAN Y DEBIAN SECURITY :..";
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

clear;
echo "";
echo "..: INSTALACION BASICA DE PAQUETES :..";
echo "";
apt-get -y install bc cpio bzip2 unzip zip p7zip-full unace cabextract arj rar unrar zstd ncompress lzma unp unalz mscompress kgb unshield nomarch dvd+rw-tools genisoimage secure-delete wodim wipe cdrdao vcdimager openssh-client openssh-server links2 nmap vim less screen htop dnsutils ntpdate ntp desktop-base manpages-es telnet build-essential module-assistant linux-headers-amd64 grub2 bash-completion chkrootkit dmidecode lshw pciutils procinfo usbutils read-edid hwinfo x86info cpuid parted testdisk quota quotatool libaio1 net-tools ethtool tcpdump sysstat firmware-linux-free iftop traceroute tcptraceroute wget hdparm lm-sensors rsync speedtest-cli ethtool etherwake gdisk;
clear;
echo "";
echo "..: REMOVIENDO PAQUETES INECESARIOS :..";
echo "";
apt-get -y autoremove;

clear;
echo "";
echo "..: AGREGANDO ARQUITECTURAS ADICIONALES :..";
echo "";
dpkg --add-architecture i386;

echo "";
echo "..: AGREGANDO INSTALACION DE PAQUETES A TRAVES DE HTTPS :..";
echo "";
apt-get -y --allow-unauthenticated install apt-transport-https;

clear;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;

clear;
echo "";
echo "..: ACTUALIZACION DE DISTRIBUCION :..";
echo "";
apt-get -y upgrade;

#Debian Multimedia
clear;
echo "";
echo "..: CONFIGURANDO DEBIAN MULTIMEDIA :..";
echo "";
echo $repositorio_debian_multimedia >> $apt_source_list;
apt-get update -oAcquire::AllowInsecureRepositories=true;
apt-get -y --allow-unauthenticated install deb-multimedia-keyring;

echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;

echo "";
echo "..: ACTUALIZACION DE DISTRIBUCION :..";
echo "";
apt-get -y upgrade;

clear;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;
echo "";
echo "..: INSTALACION DE ESCRITORIO O ENTORNO GRAFICO :..";
echo "";
apt-get -y install desktop-base xorg kde-plasma-desktop k3b k3b-i18n ark build-essential plasma-nm kde-standard;

echo "";
echo "..: INSTALACION DE HERRAMIENTAS DE APOYO :..";
echo "";
apt-get -y install filezilla gparted qmmp bluedevil kazam wireshark wireshark-common wireshark-dev wireshark-doc wireshark-gtk wireshark-qt vlc vlc-bin vlc-data vlc-l10n vlc-plugin-access-extra vlc-plugin-base vlc-plugin-fluidsynth vlc-plugin-jack vlc-plugin-notify vlc-plugin-qt vlc-plugin-skins2 vlc-plugin-video-output vlc-plugin-video-splitter vlc-plugin-visualization default-jdk default-jdk-doc default-jdk-headless default-jre default-jre-headless hunspell-es hyphen-es mythes-es pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware bluetooth bluez bluez-tools rfkill qmmp qmmp-plugin-projectm kazam obs-build obs-plugins obs-studio audacity audacity-data qtqr;
apt-get -y install acroread-data acroread-dictionary-en acroread-l10n-en acroread acroread-escript acroread-plugins;

#Google Chrome
clear;
echo "";
echo "..: CONFIGURANDO GOOGLE CHROME :..";
echo "";
cd $apt_source_list_d;
echo $repositorio_google_chrome > google-chrome.list;
cd;
wget -q $key_repositorio_google_chrome -O- | apt-key add -;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;
echo "";
echo "..: INSTALACION DE GOOGLE CHROME :..";
echo "";
apt-get -y install google-chrome-stable;

#Skype
clear;
echo "";
echo "..: CONFIGURANDO SKYPE :..";
echo "";
apt-get -y install apt-transport-https;
cd $apt_source_list_d;
echo $repositorio_skype > skype-stable.list;
cd;
wget -q $key_repositorio_skype -O- | apt-key add -;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;
echo "";
echo "..: INSTALACION DE SKYPE :..";
echo "";
apt-get -y install skypeforlinux;

#Dropbox
clear;
echo "";
echo "..: CONFIGURANDO DROPBOX :..";
echo "";
cd;
wget -c $repositorio_dropbox --output-document=dropbox.deb;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;
echo "";
echo "..: INSTALACION DE DROPBOX :..";
echo "";
dpkg -i ./dropbox.deb;
echo "";
echo "..: INSTALACION ADICIONAL DE COMPLEMENTOS DE DROPBOX :..";
echo "";
apt-get -y install;
apt-get -f install;

#OwnCloud
clear;
echo "";
echo "..: CONFIGURANDO OWNCLOUD :..";
echo "";
cd $apt_source_list_d;
echo $repositorio_owncloud > owncloud.list;
cd;
wget -q $key_repositorio_owncloud -O- | apt-key add -;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;
echo "";
echo "..: INSTALACION DE OWNCLOUD :..";
echo "";
apt-get -y install owncloud-client owncloud-client-doc owncloud-client-l10n;

#NextCloud
clear;
echo "";
echo "..: CONFIGURANDO NEXTCLOUD :..";
echo "";
cd $apt_source_list_d;
echo $repositorio_nextcloud > nextcloud.list;
cd;
wget -q $key_repositorio_nextcloud -O- | apt-key add -;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;
echo "";
echo "..: INSTALACION DE NEXTCLOUD :..";
echo "";
apt-get -y install nextcloud-client nextcloud-client-l10n;


#SublimeText
clear;
echo "";
echo "..: CONFIGURANDO SUBLIME TEXT :..";
echo "";
cd $apt_source_list_d;
echo $repositorio_sublimetext > sublimetext.list;
cd;
wget -q $key_repositorio_sublimetext -O- | apt-key add -;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;
echo "";
echo "..: INSTALACION DE SUBLIME TEXT :..";
echo "";
apt-get -y install sublime-text;

#VirtualBox
clear;
echo "";
echo "..: CONFIGURANDO VIRTUALBOX :..";
echo "";
cd $apt_source_list_d;
echo $repositorio_virtualbox > virtualbox.list;
cd;
wget -q $key_repositorio_virtualbox -O- | apt-key add -;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;
echo "";
echo "..: INSTALACION DE VIRTUALBOX :..";
echo "";
apt-get -y install virtualbox-6.1;

#AnyDesk
clear;
echo "";
echo "..: CONFIGURANDO ANYDESK :..";
echo "";
cd $apt_source_list_d;
echo $repositorio_anydesk > anydesk-stable.list;
cd;
wget -q $repositorio_anydesk -O- | apt-key add -;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;
echo "";
echo "..: INSTALACION DE ANYDESK :..";
echo "";
apt-get -y install anydesk;

#TEAMS
clear;
echo "";
echo "..: CONFIGURANDO TEAMS :..";
echo "";
cd $apt_source_list_d;
echo $repositorio_teams > teams.list;
cd;
wget -q $repositorio_teams -O- | apt-key add -;
echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;
echo "";
echo "..: INSTALACION DE ANYDESK :..";
echo "";
apt-get -y install teams;

clear;
echo "";
echo "..: ELIMINANDO PAQUETES DESCARGADOS :..";
echo "";
clear;
apt-get clean all;