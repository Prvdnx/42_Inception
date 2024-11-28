#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

service mysql start;
sleep 3;

echo "Creating admin user"
mysql -u root -e "CREATE DATABASE $DB_NAME;"
mysql -u root -e "CREATE USER '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_PASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

echo "Setting root user password"
mysqladmin -u root password "$DB_PASS"

mysqladmin -u root -p"$DB_PASS" shutdown
fi

exec mysqld_safe --bind-address=0.0.0.0






### to create a new database and user for WordPress. It checks if the database already exists, and if not, it
# creates it and grants all privileges to the user. It also sets the root user password. Finally, it starts the
# MySQL server in safe mode, which is necessary to bind it to the 0.0.0.0 address.

# - checks if the database directory exists. If it doesn't, it means that the database hasn't been created yet.
# - starts the MySQL server.
# - creates the database.
# - creates a new user with the specified username and password.
# - grants all privileges to the new user on all databases.
# - flushes the privileges to ensure that the changes take effect immediately.
# - sets the root user password.
# - shuts down the MySQL server.
# - starts the MySQL server in safe mode, which is necessary to bind it to the 0.0.0.0 address.


# docker-compose -f srcs/docker-compose.yml up -d mariadb-data
# docker exec -it mariadb-data bash
# mysql -u wpuser -p Inception -h mariadb-data
# show databases;
# use wordpress;
# show tables;
# select * from wp_users;
# select * from wp_usermeta;
# select * from wp_posts;
# select * from wp_postmeta;
# select * from wp_comments;
# select * from wp_commentmeta;
# select * from wp_terms;
# select * from wp_term_taxonomy;
# select * from wp_term_relationships;
# select * from wp_termmeta;
# select * from wp_options;
# select * from wp_links;
# select * from wp_linkmeta;
# select * from wp_site;
# select * from wp_sitemeta;
# select * from wp_signups;
# select * from wp_signups_meta;


# Inserting data into table 'wp_users' in 'wordpress' database
# INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
# (1, 'admin', MD5('admin'), 'admin', 'admin@example.com', '', '2022-01-01 00:00:00', '', 0, 'admin');

# INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
# (1, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";s:1:\"1\";}'),
# (2, 1, 'wp_user_level', '10');

# INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
# (1, 1, '2022-01-01 00:00:00', '2022-01-01 00:00:00', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2022-01-01 00:00:00', '2022-01-01 00:00:00', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 0);

# INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
# (1, 'siteurl', 'http://localhost/wordpress', 'yes'),
# (2, 'home', 'http://localhost/wordpress', 'yes'),
# (3, 'blogname', 'My WordPress Site', 'yes'),
# (4, 'blogdescription', '', 'yes'),
# (5, 'users_can_register', '0', 'yes'),
# (6, 'admin_email', 'admin@example.com', 'yes'),
# (7, 'start_of_week', '1', 'yes'),
# (8, 'use_balanceTags', '1', 'yes'),
# (9, 'use_smilies', '1', 'yes'),
# (10, 'require_name_email', '1', 'yes'),
# (11, 'comments_notify', '1', 'yes'),
# (12, 'posts_per_page', '10', 'yes'),
# (13, 'date_format', 'F j, Y', 'yes'),
# (14, 'time_format', 'g:i a', 'yes'),
# (15, 'timezone_string', 'UTC', 'yes'),
# (16, 'gmt_offset', '0', 'yes'),
# (17, 'default_category', '1', 'yes'),
# (18, 'default_comment_status', 'open', 'yes'),
# (19, 'default_ping_status', 'open', 'yes'),
# (20, 'default_pingback_flag', '1', 'yes'),
# (21, 'default_post_edit_rows', '10', 'yes'),
# (22, 'posts_per_rss', '10', 'yes'),
# (23, 'rss_use_excerpt', '0', 'yes'),
# (24, 'mailserver_url', 'mail.example.com', 'yes'),
# (25, 'mailserver_login', '', 'yes'),
# (26, 'mailserver_pass', '', 'yes'),
# (27, 'mailserver_port', '110', 'yes'),
# (28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),