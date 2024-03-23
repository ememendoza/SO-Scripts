#!/bin/bash
clear;
echo "";
echo "..: ELIMINACION DE PAQUETES DESCARGADOS :..";
echo "";
apt-get clean all;

echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;

echo "";
echo "..: ACTUALIZACION DE SISTEMA OPERATIVO :..";
echo "";
apt-get -y upgrade;

clear;
echo "";
echo "..: ELIMINACION PAQUETES SOBRANTES :..";
echo "";
apt-get -y autoremove;

echo "";
echo "..: ACTUALIZACION LISTA DE PAQUETES :..";
echo "";
apt-get update;

echo "";
echo "..: ACTUALIZACION DE DISTRIBUCION :..";
echo "";
apt-get -y dist-upgrade; apt-get -y full-upgrade;

echo "";
echo "..: ELIMINACION PAQUETES SOBRANTES :..";
echo "";
apt-get -y autoremove;

echo "";
echo "..: ELIMINACION DE PAQUETES DESCARGADOS :..";
echo "";
apt-get clean all;


cd /root;
mkdir -p /root/scripts/os;
touch /root/scripts/os/actualizacion.sh; chmod 755 /root/scripts/os/actualizacion.sh; nano /root/scripts/os/actualizacion.sh;

crontab -e

0 9 * * * /root/scripts/os/actualizacion.sh
0 13 * * * /root/scripts/os/actualizacion.sh
0 21 * * * /root/scripts/os/actualizacion.sh