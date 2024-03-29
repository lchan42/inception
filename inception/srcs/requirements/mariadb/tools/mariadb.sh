if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Database already exists"
else
# Set root so that connexion without password is not possible
service mysql start
sleep 4
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "FLUSH PRIVILEGES;"
mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${MYSQL_ROOT_PWD} shutdown
sleep 2
fi

exec $@

#### just a reminder ####
# mysql -u root -p --> --updade --password
# mysql -u root -p${MYSQL_ROOT_PWD} -e "SELECT user, host, password, Shutdown_priv FROM mysql.user;"

#docker run --entrypoint /bin/bash -it mariadb
