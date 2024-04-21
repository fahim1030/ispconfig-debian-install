#!/bin/bash

# Download ISPConfig
cd /tmp/ispconfig
wget -O ispconfig.tar.gz https://www.ispconfig.org/downloads/ISPConfig-3-stable.tar.gz
tar -zxvf ispconfig.tar.gz

# Install ISPConfig
cd ispconfig3_install/install/
sudo php -q install.php

sudo rm -r /tmp/ispconfig
echo
echo
echo "Congratulation!!! ISPConfig installation complete."
echo "URL: https://your-ip:8080"
echo "Username: admin"
echo "Password: Your Set Password"