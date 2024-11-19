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



# docker exec -it wordpress-site bash

# # to allow WP write to filesystem directly without requirin FTP credentials: add FS_METHOD to wp-config.php
# if ! grep -q "FS_METHOD" /var/www/html/wp-config.php; then
#     echo "define('FS_METHOD', 'direct');" >> /var/www/html/wp-config.php
# fi

# # to fix Theme install error "Could not create directory. /var/www/html/wp-content/upgrade": set correct permissions
# chown -R www-data:www-data /var/www/html
# find /var/www/html -type d -exec chmod 755 {} \;
# find /var/www/html -type f -exec chmod 644 {} \;
