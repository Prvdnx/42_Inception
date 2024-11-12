FROM debian:buster
RUN apt-get update -y && apt-get install mariadb-server -y
RUN sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb.sh /
RUN	chmod 755 /home/mariadb.sh
VOLUME ["/var/lib/mysql"]
EXPOSE	3306
ENTRYPOINT bash /home/mariadb.sh



# Uses Debian Buster as the base image for the Docker container, providing a stable and compatible environment.
# Updates the package list and installs the MariaDB server package, providing the database service for the application.
# Modifies the default MariaDB configuration to allow remote connections by commenting out the bind-address setting.
# Copies the initialization script to the root directory of the container.
# Sets executable permissions on the initialization script, allowing it to be run when the container starts.
# Creates a persistent volume for database files, ensuring that data is not lost when the container is stopped or removed.
# Exposes port 3306 for the MySQL protocol, allowing other services to connect to the MariaDB server.
# Uses the initialization script as the entrypoint, which will be executed when the container starts to set up the database.