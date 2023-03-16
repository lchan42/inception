export MYSQL_DATABASE=Wordpress
export MYSQL_ROOT_PWD=MariadbRootPwd
export MYSQL_USER=MariadbUser
export MYSQL_PWD=MariadbPwd

set -x

# mysql_install_db

service mysql start

sleep 2

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then

	echo "Database already exists"
else

# Set root option so that connexion without root password is not possible

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -e "UPDATE mysql.user  SET Password='${MYSQL_ROOT_PWD}' WHERE User='root';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
mysql -e "SELECT user, host, password, Shutdown_priv FROM mysql.user;"
mysql -e "FLUSH PRIVILEGES;"
fi

sleep 2

sudo service mysql restart


# while ! mysqladmin ping -h mariadb --silent; do
# 	sleep 1
# done

set +x


# mysql -e "UPDATE mysql.user  SET Password='${MYSQL_ROOT_PWD}' WHERE User='root';"
# mysql -uroot -p${MYSQL_ROOT_PWD} -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
# mysql -uroot -p${MYSQL_ROOT_PWD} -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
# mysql -uroot -p${MYSQL_ROOT_PWD} -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PWD}';"
# mysql -uroot -p${MYSQL_ROOT_PWD} -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
# mysql -uroot -p${MYSQL_ROOT_PWD} -e "SELECT user, host, password, Shutdown_priv FROM mysql.user;"
# mysql -uroot -p${MYSQL_ROOT_PWD} -e "FLUSH PRIVILEGES;"
# mysql -uroot -p${MYSQL_ROOT_PWD} -e "QUIT"
# mysql -uroot -p${MYSQL_ROOT_PWD} -e "SHOW GRANTS FOR 'root'@'localhost';"

# echo "UPDATE mysql.user SET Password='${MYSQL_ROOT_PWD}' WHERE User='root'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}'; CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`; CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PWD}'; GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}'; SELECT user, host, password, Shutdown_priv FROM mysql.user; FLUSH PRIVILEGES; QUIT;" | mysql -u root

# killall -15 mysqld
# service mysql stop;
# mysqladmin -u root -p${MYSQL_ROOT_PWD} shutdown
# wait;
# exec mysqld_safe --skip-grant-tables

# && mysql -e "SHOW GRANTS FOR 'root'@'%';"\
# && mysql -e "SHOW GRANTS FOR 'root'@'localhost';"\
# && mysql -e "SHOW GRANTS FOR '${MYSQL_USER}'@localhost;"\



# mysqladmin -u root -p${MYSQL_ROOT_PWD} shutdown;
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '';"

# mysql -e "mysql -u root -p${MYSQL_ROOT_PWD};"

# killall -15 mysqld

# echo "goodbye from Maria"

# exec mysqld_safe -p${MYSQL_ROOT_PWD}

# 'root'@'localhost' root accession the DB from localhost.
# 'root'@'%' root accession the DB from any host.




# #### just a reminder ####
# # mysql -u root -p --> --updade --password
# mysql -e "Select user from mysql.user;" --> show all user
# mysql -e "DESC mysql.user;" -->
# mysql -e "SELECT user, host, password, Shutdown_priv FROM mysql.user;"






# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$MYSQL_ROOT_PWD shutdown
# service mysql -u -root -p start ;
# systemctl start mysqld;
# exec mysqld_safe



#### just a reminder ####
# mysql -u root -p --> --updade --password
