FROM debian:buster

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install mariadb-server

COPY ./tools/mariadb.sh /home

RUN chmod 755 /home/mariadb.sh

RUN mysql_install_db

EXPOSE 3306

ENTRYPOINT [ "/home/mariadb.sh" ]






### this dockerfile sets up a mariadb server container:
# - uses debian buster as the base image for this container
# - updates the package list and upgrades the system packages to ensure we
    # have the latest versions
# - installs mariadb server, which is the database management system we'll use
# - copies the initialization script into the container
# - sets the permissions for the script to be executable
# - initializes the mariadb database
# - exposes port 3306 for mariadb to listen on
# - sets the entrypoint script to run when the container starts
