#!/bin/sh -x
IP_ADDRESS=$(ifconfig | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk '{ print $2}')

fetch https://github.com/Thefrank/freebsd-port-sooners/releases/download/20210613/radarrv3-3.2.2.5080.txz

pkg install -y radarrv3-3.2.2.5080.txz

rm radarrv3-3.2.2.5080.txz

sysrc radarr_enable="YES"

chown -R radarr:radarr /usr/local/share/radarr
chmod 755 /usr/local/radarr

service radarr start

echo -e "Radarr is now installed.\n" > /root/PLUGIN_INFO
echo -e "\nPlease open your web browser and go to http://${IP_ADDRESS}:7878 to configure Radarr.\n" >> /root/PLUGIN_INFO