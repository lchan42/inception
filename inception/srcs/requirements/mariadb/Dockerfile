FROM		debian:buster

# Install nginx + openssl and configure them
RUN				apt-get update \
				&& apt-get upgrade -y \
				&& apt-get install mariadb-server -y

COPY			./tools/mariadb_script.sh ./
RUN				chmod 755 mariadb_script.sh
COPY			./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE			3306

ENTRYPOINT		"./mariadb_script.sh"

