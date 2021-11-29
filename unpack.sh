#!/bin/sh

# Unpack the payload
mkdir 'unpack'
unzip '*.zip' -d unpack

# Move down to the files directory for wp-cli
cd files

# Grab the credentials out of wp-config.php
WPDBNAME=`cat wp-config.php | grep DB_NAME | cut -d \' -f 4`
WPDBUSER=`cat wp-config.php | grep DB_USER | cut -d \' -f 4`
WPDBPASS=`cat wp-config.php | grep DB_PASSWORD | cut -d \' -f 4`

# Import the Database
wp db clean
wp db import ../unpack/backup.sql

# Update old URLs
read -p 'Original Domain (with http): ' originaldomain
read -p 'New Domain (with http): ' newdomain
wp search-replace $originaldomain $newdomain
wp cache flush

# Move up to root
cd ~

# Move everything to /wp-content
rsync -avh --progress unpack/files/wp-content/ files/wp-content

# Clean up
rm -rf ~/unpack
rm -rf ~/migrate.sh
rm -rf ~/*.sql
rm -rf ~/*.zip
