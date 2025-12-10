# Inception

This project aims to broaden your knowledge of system administration by using Docker to virtualize several heavy services. The goal is to set up a small infrastructure composed of different services using `docker-compose`.

## Services
The infrastructure consists of the following services, each running in its own container:
- **NGINX**: Web server with TLSv1.2 or TLSv1.3 only.
- **WordPress**: Running with PHP-FPM.
- **MariaDB**: Database for WordPress.
- **Volumes**: Persistent storage for WordPress database and website files.
- **Docker Network**: Connects the containers.

## Architecture
- A Docker network is established to allow communication between containers.
- NGINX serves as the entry point, handling HTTPS traffic/requests and forwarding PHP requests to WordPress.
- WordPress connects to the MariaDB database.

## Usage
To build and run the infrastructure:
```bash
make
```
To stop and clean up:
```bash
make down
```
