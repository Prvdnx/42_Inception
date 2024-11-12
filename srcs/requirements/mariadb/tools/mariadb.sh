chown -R mysql:mysql /var/lib/mysql
if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8;"
mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PW';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%'"
mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root password $ROOT_PW
service mysql stop
fi
/usr/bin/mysqld_safe



# Sets the proper ownership of the MySQL data directory to the mysql user, ensuring correct permissions for database operations.
# Checks if the specified database already exists. If it does not:
	# Starts the MySQL service temporarily to perform initial setup tasks.
	# Creates a new database with the specified name and UTF-8 encoding if it does not already exist.
	# Creates a new database user with the specified username and password.
	# Grants all privileges on the new database to the newly created user.
	# Flushes the privileges to ensure that the changes take effect immediately.
	# Sets the root password for the MySQL server.
	# Stops the temporary MySQL service after the initial setup is complete.
# Starts the MySQL server in safe mode for production use, providing a secure and stable environment for database operations.