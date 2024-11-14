all: create_dirs
	sudo docker-compose -f srcs/docker-compose.yml up --build -d
	@echo "127.0.0.1	ookamonu.42.fr" >> /etc/hosts

clean:
	docker-compose -f srcs/docker-compose.yml down
	docker image prune -a

create_dirs:
	mkdir -p ~/ookamonu/data/wordpress_data
	mkdir -p ~/ookamonu/data/mariadb_data

fclean: clean
	docker volume rm $$(docker volume ls -q)
	rm -rf ~/data/wordpress_data/* ~/data/mariadb_data/*

re: fclean all


# all: Builds and starts the Docker Compose services in detached mode, using the specified docker-compose.yml file.
# clean: Stops and removes the Docker Compose services, and prunes all unused Docker images to free up space.
# fclean: Removes all Docker volumes and deletes the WordPress and MariaDB data directories, ensuring a clean state.
# create_dirs: Creates the necessary directories for WordPress and MariaDB data storage, ensuring that the required directories exist before starting the services.


