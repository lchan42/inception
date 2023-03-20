#!bin/bash

export MYSQL_DATABASE=Wordpress
export MYSQL_ROOT_PWD=MariadbRootPwd
export MYSQL_USER=MariadbUser
export MYSQL_PWD=MariadbPwd

export WORDPRESS_TITLE=Inception
export WORDPRESS_ADMIN_USER=Admin42
export WORDPRESS_ADMIN_PASSWORD=password42
export WORDPRESS_ADMIN_EMAIL=email@domain.com


sleep 10
wp core download	--allow-root --locale=fr_FR
wp config create	--allow-root \
					--dbname=$MYSQL_DATABASE \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PWD \
					--dbhost=mariadb:3306 \
					--path='/var/www/wordpress'

wp core install		--allow-root --locale=fr_FR\
					--url='https://lchan.42.fr' \
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ADMIN_USER \
					--admin_password=$WORDPRESS_ADMIN_PASSWORD \
					--admin_email=$WORDPRESS_ADMIN_EMAIL

#wp user create --allow-root ${WORDPRESS_USER_2} ${WORDPRESS_USER_2_EMAIL} --role=author --user_pass=${WORDPRESS_USER_2_MDP}
# wp cache flush --allow-root
# wp theme install wpkites --activate --allow-root


mkdir /run/php

# -F : Force to stay in foreground and ignore daemonize option from configuration file.
exec /usr/sbin/php-fpm7.3 -F -R

