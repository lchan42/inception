#!bin/bash


sleep 10
#download wordpress
wp core download			--allow-root --path='/var/www/wordpress'

# creat wp-config.php
wp config create			--allow-root \
							--dbname=$MYSQL_DATABASE \
							--dbuser=$MYSQL_USER \
							--dbpass=$MYSQL_PWD \
							--dbhost=mariadb:3306 \
							--path='/var/www/wordpress'

# install wordpress
# test with skip-email
wp core install				--allow-root --locale=fr_FR --skip-email \
							--url='https://lchan.42.fr' \
							--title=$WORDPRESS_TITLE \
							--admin_user=$WORDPRESS_ADMIN_USER \
							--admin_password=$WORDPRESS_ADMIN_PASSWORD \
							--admin_email=$WORDPRESS_ADMIN_EMAIL \
							--path='/var/www/wordpress'

# creat new user
wp user create 				--allow-root ${WORDPRESS_USER_2} ${WORDPRESS_USER_2_EMAIL} \
							--role=author \
							--user_pass=${WORDPRESS_USER_2_MDP} \
							--path='/var/www/wordpress'

# update privilages
wp cache flush				--allow-root

# installing a theme
wp theme install wpkites	--activate --allow-root


mkdir /run/php

# -F : Force to stay in foreground and ignore daemonize option from configuration file.
exec /usr/sbin/php-fpm7.3 -F -R

# note :
# [--role=<role>] Possible values include ‘administrator’, ‘editor’, ‘author’, ‘contributor’, ‘subscriber’.
