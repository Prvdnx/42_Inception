FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install nginx openssl

RUN mkdir /etc/nginx/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/nginx-selfsigned.key \
-out /etc/nginx/ssl/nginx-selfsigned.crt \
-subj "/C=TH/L=Bangkok/O=42/OU=student/CN=ookamonu.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]






### this Dockerfile sets up an nginx server container:
# - uses debian buster as the base image for this container.
# - updates the package list and upgrades the system packages to ensure we have the latest versions.
# - installs nginx and openssl for serving the site over HTTPS.
# - creates a directory for SSL certificates.
# - generates a self-signed SSL certificate.
# - copies the nginx configuration file into the container.
# - sets the command to run nginx in the foreground when the container starts.
