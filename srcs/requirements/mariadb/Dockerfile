FROM debian:buster

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install mariadb-server

COPY ./tools/mariadb.sh /home

RUN chmod 755 /home/mariadb.sh

RUN mysql_install_db

EXPOSE 3306

ENTRYPOINT [ "/home/mariadb.sh" ]