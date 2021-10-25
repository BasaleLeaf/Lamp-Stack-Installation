#!/bin/bash
echo -e "\nUpdating Apt Packages and upgrading latest patches....\n"
sudo apt-get update -y && sudo apt-get upgrade -y
echo -e "\nInstalling Apache2, MySQl and PHP.....\n"
sudo apt-get install lamp-server^ -y
sudo apt-get install php-zip php-xml php-gd php-curl php-imap -y
echo -e "\nSecuring MySQL....\n"
#Replace somepass with your own password password
mysql_secure_installation <<EOF
n
somepass
somepass
y
y
y
y
y
EOF
echo -e "\nPermissions for /var/www\n"
sudo chown -R www-data:www-data /var/www
echo -e "\n Permissions have been set\n"
echo -e "\n\nEnabling Modules\n"
sudo a2enmod rewrite
echo -e "\nRestarting Apache\n"
sudo service apache2 restart
echo -e "\nLAMP Installation Completed"
exit 0
