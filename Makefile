all:
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down
	docker image prune -a

fclean:
	docker volume rm $(docker volume ls -q)
	rm -rf /home/Incept/data/wordpress_data/* /home/Incept/data/mariadb_data/*

create_dirs:
	mkdir -p /home/Incept/data/wordpress_data
	mkdir -p /home/Incept/data/mariadb_data



# all: Builds and starts the Docker Compose services in detached mode, using the specified docker-compose.yml file.
# clean: Stops and removes the Docker Compose services, and prunes all unused Docker images to free up space.
# fclean: Removes all Docker volumes and deletes the WordPress and MariaDB data directories, ensuring a clean state.
# create_dirs: Creates the necessary directories for WordPress and MariaDB data storage, ensuring that the required directories exist before starting the services.