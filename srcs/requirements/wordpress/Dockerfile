FROM debian:buster

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y curl php-fpm php-mysql php-curl php-gd php-mbstring php-xml \
    php-xmlrpc php-soap php-intl php-zip mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/ && chmod 755 /run/php/

RUN sed -i 's#listen = /run/php/php7.3-fpm.sock#listen = 9000#g' /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/wdps.sh /home

RUN chmod 755 /home/wdps.sh

EXPOSE 9000

ENTRYPOINT [ "/home/wdps.sh" ]

CMD [ "php-fpm7.3", "-F", "-R" ]






### this Dockerfile sets up a WordPress site container:
# - uses debian buster as the base image for this container
# - updates the package list and upgrades the system packages to ensure we have the latest versions
# - installs necessary packages for running WordPress and PHP
# - downloads and sets up WP-CLI for managing WordPress from the command line
# - creates necessary directories and sets permissions
# - modifies the PHP-FPM configuration to listen on port 9000
# - copies the initialization script into the container
# - sets the permissions for the script to be executable
# - exposes port 9000 for PHP-FPM to listen on
# - sets the entrypoint script to run when the container starts
# - sets the command to run PHP-FPM in the foreground when the container starts