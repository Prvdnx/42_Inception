FROM debian:buster
RUN apt-get update -y && \
	apt-get install -y php7.3 php-mysql php-fpm mariadb-client
RUN apt-get update -y && apt-get install -y wget && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	apt remove -y wget
RUN wp core download --path=/usr/src/wordpress --allow-root
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN	chmod 777 /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/wp.sh /
VOLUME [ "/var/www/" ]
EXPOSE 9000
ENTRYPOINT	bash /home/wp.sh

# Uses Debian Buster as the base image for the Docker container, providing a stable and compatible environment.
# Updates the package list and installs the required PHP packages (php7.3, php-mysql, php-fpm) and the MariaDB client.
# Updates the package list again and installs wget, a utility for downloading files from the web.
	# Downloads the WP-CLI Phar file, makes it executable, and moves it to /usr/local/bin/wp to make it globally accessible.
	# Removes wget to reduce the image size after it is no longer needed.
# Downloads the WordPress core files to the specified path using WP-CLI.
# Copies the PHP-FPM pool configuration file to the appropriate directory.
# Sets the permissions of the PHP-FPM pool configuration file to be writable by all users.
# Copies the WordPress setup script to the root directory of the container.
# Creates a volume for the WordPress files, allowing them to persist outside the container.
# Exposes port 9000 for PHP-FPM to listen for incoming requests.
# Sets the WordPress setup script as the entrypoint, which will be executed when the container starts.