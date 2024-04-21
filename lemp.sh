#!/bin/bash

# Update package lists
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y
sudo apt-get remove apache2 -y
sudo apt autoremove -y
# Install necessary packages
sudo apt install -y nginx mariadb-server php-fpm php-mysql php-cli php-json php-intl php-imagick php-gd php-mbstring php-curl php-zip php-xml unzip curl wget pure-ftpd-mysql

# Generate a random password for MySQL root user
MYSQL_ROOT_PASSWORD=$(openssl rand -base64 12)

# Start MySQL secure installation process
echo "Starting MySQL secure installation process..."
sudo mysql_secure_installation <<EOF

n
y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
y
y
y
EOF

echo "MySQL secure installation completed."

# Install Postfix (select 'Internet Site' during installation for general use)
DEBIAN_FRONTEND=noninteractive apt install -y postfix

# Install Pure-FTPd, BIND9, Dovecot, Spamassassin, Amavisd , Fail2ban
sudo apt install -y pure-ftpd bind9 dovecot-core dovecot-imapd dovecot-pop3d spamassassin amavisd-new fail2ban

echo "Careful!!! Note your root password of MySQL. It will need future."
echo "Mysql root password: $MYSQL_ROOT_PASSWORD"
