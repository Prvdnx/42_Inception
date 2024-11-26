all: mkdirs
	docker-compose -f srcs/docker-compose.yml up --build -d
	@sudo sh -c 'echo "127.0.0.1	ookamonu.42.fr" >> /etc/hosts'

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

down:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

mkdirs:
	mkdir -p ~/ookamonu/data/wordpress_data
	mkdir -p ~/ookamonu/data/mariadb_data

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

clean: down
	@sudo rm -rf ~/ookamonu/data/*

re: clean all


.PHONY: up down stop clean logs




### this Makefile defines tasks for managing the Docker Compose services:
# - all: builds and starts the Docker Compose services in detached mode, using the specified docker-compose.yml file.
# - stop: stops the Docker Compose services.
# - down: stops and removes the Docker Compose services, and prunes all unused Docker images to free up space.
# - mkdirs: creates the necessary directories for WordPress and MariaDB data storage, ensuring that the required directories exist before starting the services.
# - logs: shows the logs of the Docker Compose services.
# - clean: stops and removes the Docker Compose services, and deletes the WordPress and MariaDB data directories.
# - re: cleans and rebuilds the Docker Compose services.



## Remove leftover Docker resources - docker system prune -af --volumes
## View container content - docker exec wordpress-site cat /var/www/html/wp-config.php
## List a container root directory - docker exec wordpress-site ls -la /var/www/html
## View container logs - docker logs wordpress-site - 
## Copy files from container to host and from host to container
# docker cp wordpress-site:/var/www/html/wp-config.php ./wp-config.php
# docker cp 42portals-theme  wordpress-site:/var/www/html/wp-content/themes/