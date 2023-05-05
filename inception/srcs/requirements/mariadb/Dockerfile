FROM		debian:buster

# Install nginx + openssl and configure them
RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get install -y mariadb-server mariadb-client

COPY		./tools/mariadb.sh ./
RUN			chmod 755 mariadb.sh

COPY		./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE		3306

ENTRYPOINT ["sh", "./mariadb.sh"]
CMD			"mysqld_safe"

# CMD			"/mariadb.sh"
