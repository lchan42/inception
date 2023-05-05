FROM		debian:buster

# Install nginx + openssl and configure them

RUN			apt-get update \
			&& apt-get upgrade -y \
			# we 'll install wordpress via a link, we therefore need wget
			&& apt-get install -y	wget \
									php7.3 \
									php-fpm \
									php-mysql \
									mariadb-client


WORKDIR 	/var/www

# RUN 		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/wordpress
# RUN 		tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN			mkdir /var/www/wordpress -p

# RUN 		chown -R root:root /var/www/wordpress
RUN 		chown -R www-data:www-data /var/www/wordpress
RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/local/bin/wp

# RUN			wget https://github.com/wp-cli/wp-cli/raw/master/utils/wp-completion.bash

COPY ./conf/auto_config.sh ./

RUN chmod +x ./auto_config.sh

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/www.conf /etc/php7/php-fpm/www.conf

ENTRYPOINT ["sh", "./auto_config.sh"]

#CMD ["/usr/bin/php7.3", "-F"]
#https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/#activate-bash-completion
