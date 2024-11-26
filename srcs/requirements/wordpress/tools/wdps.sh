#!/bin/bash

sleep 5

if [ ! -f "/var/www/html/wp-config.php" ]; then
	if cd /var/www/html && wp core download --allow-root
	then
	wp config create --allow-root \
		--path=/var/www/html/ --dbname=$DB_NAME --dbuser=$DB_ADMIN \
		--dbpass=$DB_PASS --dbhost=$DB_HOST \
		&& \
		wp core install \
		--allow-root \
		--title=$WP_TITLE --admin_user=$WP_ADMIN --url=$WP_URL \
		--admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL \
		&& \
		wp user create \
		--allow-root \
		$WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASS
	fi
fi

exec "$@"






### this script initializes WordPress by downloading the core files, creating the configuration file,
	# installing WordPress, and creating a user. Here's a breakdown:

# - waits for 5 seconds to ensure services are up.
# - checks if the WordPress configuration file exists. If not, it proceeds with installation.
# - changes to the WordPress directory and downloads the core files.
# - creates the WordPress configuration file with database details.
# - installs WordPress with the provided title, admin user, URL, password, and email.
# - creates an additional user with the specified username, email, and password.
# - executes any additional commands passed to the script.

# docker exec -it wordpress-site bash

## to allow WP write to filesystem directly without requiring FTP credentials: add FS_METHOD to wp-config.php
# if ! grep -q "FS_METHOD" /var/www/html/wp-config.php; then
#     echo "define('FS_METHOD', 'direct');" >> /var/www/html/wp-config.php
# fi

## to fix Theme install error "Could not create directory. /var/www/html/wp-content/upgrade": set correct permissions
# chown -R www-data:www-data /var/www/html
# find /var/www/html -type d -exec chmod 755 {} \;
# find /var/www/html -type f -exec chmod 644 {} \;

## Option 1: Keep debugging on but hide notices
# docker exec wordpress-site wp config set WP_DEBUG_DISPLAY false --allow-root --path=/var/www/html

## Option 2: Turn off debugging completely
# docker exec wordpress-site wp config set WP_DEBUG false --allow-root --path=/var/www/html
