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

# all: Builds and starts the Docker Compose services in detached mode, using the specified docker-compose.yml file.
# clean: Stops and removes the Docker Compose services, and prunes all unused Docker images to free up space.
# fclean: Removes all Docker volumes and deletes the WordPress and MariaDB data directories, ensuring a clean state.
# create_dirs: Creates the necessary directories for WordPress and MariaDB data storage, ensuring that the required directories exist before starting the services.


