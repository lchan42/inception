FROM		debian:buster

# Install nginx + openssl and configure them
RUN				apt-get update \
				&& apt-get upgrade -y \
				&& apt-get install mariadb-server -y

COPY			conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE			3306

CMD			"/mariadbscript.sh"
