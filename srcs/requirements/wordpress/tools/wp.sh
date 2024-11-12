
mkdir -p /run/php
while ! mysql -h mariadb -u $DB_USER -p$DB_PW $DB_NAME -e "SELECT 'OK' AS status;"; do
	sleep 5
done
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	cp -R /usr/src/wordpress /var/www
	wp core config --path=/var/www/wordpress --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PW} --allow-root
	wp core install --path=/var/www/wordpress --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_N} \
					--admin_password=${WP_ADMIN_PW} --admin_email=${WP_ADMIN_MAIL} --skip-email --allow-root
	wp user create --path=/var/www/wordpress --allow-root ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PW}
fi
/usr/sbin/php-fpm7.3 --nodaemonize



# Creates the PHP-FPM runtime directory if it does not already exist. This is necessary for PHP-FPM to function correctly.
# Enters a loop that repeatedly checks if the MariaDB service is ready by attempting to execute a simple SQL query.
# The loop will continue to run until the query succeeds, indicating that the database is ready to accept connections.
# If the WordPress configuration file does not exist, it means WordPress has not been set up yet.
	# Copies the WordPress core files from the source directory to the web root directory.
	# Uses WP-CLI to generate the WordPress configuration file with the specified database connection details.
	# Installs WordPress using WP-CLI with the provided site URL, title, admin username, admin password, and admin email.
	# Skips the email notification for the admin user creation.
	# Creates an additional WordPress user with the specified username, email, role (author), and password.
# Starts PHP-FPM in non-daemon mode to keep the container running and handle PHP requests.