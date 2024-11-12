FROM debian:buster
RUN	apt update -y && apt install nginx openssl -y
COPY ./conf/config.conf /etc/nginx/sites-available/default
RUN openssl req -newkey rsa:2048 -nodes -x509 -days 365 \ 
	-subj "/C=TH/ST=Bangkok/L=Bangkok/O=ookamonu/CN=ookamonu.42.fr" \
	-keyout etc/ssl/key.key  \
	-out etc/ssl/cert.cert && \
	chmod 777 /etc/ssl/*
RUN	chown -R www-data /var/www/
VOLUME [ "/var/www/" ]
EXPOSE 443
CMD	["nginx","-g","daemon off;"]



# Uses Debian Buster as the base image for the Docker container, providing a stable and compatible environment.
# Updates the package list and installs NGINX web server and OpenSSL for SSL/TLS certificate generation.
# Copies a custom NGINX configuration file to the default site location, configuring NGINX to serve the WordPress site.
# Generates a self-signed SSL certificate with specific parameters:
	# 2048-bit RSA key for strong encryption.
	# Valid for 365 days.
	# Contains organization information (Country: TH, State/City: Bangkok, etc.).
# Sets the permissions of the SSL certificate files to be writable by all users.
# Changes the ownership of the web root directory to the www-data user, ensuring proper permissions for NGINX.
# Creates a volume mount point for web files, allowing them to persist outside the container.
# Exposes port 443 for HTTPS traffic, enabling secure connections to the web server.
# Runs NGINX in foreground mode to keep the container running and handle incoming web requests.