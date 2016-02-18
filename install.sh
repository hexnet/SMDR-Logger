#!/bin/bash
#
# Author: "Charlie Tank" <hexnet@users.noreply.github.com>
# GitHub: https://github.com/hexnet 
# 
# Original work by: "Gerry Armstrong" (https://sourceforge.net/projects/simplesmdr)
#

if [ $(id -u) != 0 ]; then
  echo "This installer requires root permissions."
  sudo "$0" "$@"
  exit
fi

echo "  _____ __  __ _____  _____        _                                 "
echo " / ____|  \/  |  __ \|  __ \      | |                                "
echo "| (___ | \  / | |  | | |__) |_____| |     ___   __ _  __ _  ___ _ __ "
echo " \___ \| |\/| | |  | |  _  /______| |    / _ \ / _\` |/ _\` |/ _ \ '__|"
echo " ____) | |  | | |__| | | \ \      | |___| (_) | (_| | (_| |  __/ |   "
echo "|_____/|_|  |_|_____/|_|  \_\     |______\___/ \__, |\__, |\___|_|   "
echo "                                                __/ | __/ |          "
echo "                                               |___/ |___/           "
echo ""
echo ""
echo ""
echo "Installing SMDR-logger"
echo ""
echo ""

cp smdr-logger /usr/local/sbin/smdr-logger
cp smdr-logger.init /etc/init.d/smdr-logger
cp smdr.conf /etc/smdr-logger/smdr.conf
mkdir -p /var/log/smdr-logger
chown root.root /usr/local/sbin/smdr-logger
chown root.root /etc/init.d/smdr-logger
chown root.root /etc/smdr-logger/smdr.conf
chown root.syslog /var/log/smdr-logger
chmod 700 /usr/local/sbin/smdr-logger
chmod 700 /etc/init.d/smdr-logger
chmod 600 /etc/smdr-logger/smdr.conf
chmod 775 -R /var/log/smdr-logger
update-rc.d smdr-logger defaults 90 10
echo ""
echo ""
echo "SMDR-logger installed."
echo "Configure by editing the config file at /etc/smdr-logger/smdr.conf"
echo "Once configured, start the service with 'service smdr-logger start'"
exit 0
