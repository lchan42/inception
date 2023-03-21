# export MYSQL_DATABASE=Wordpress
# export MYSQL_ROOT_PWD=MariadbRootPwd
# export MYSQL_USER=MariadbUser
# export MYSQL_PWD=MariadbPwd

# set -x

service mysql start

sleep 2

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then

	echo "Database already exists"
else

# Set root so that connexion without password is not possible
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"


mysql -u root -p${MYSQL_ROOT_PWD} -e  "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "FLUSH PRIVILEGES;"
mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "FLUSH PRIVILEGES;"
mysql -u root -p${MYSQL_ROOT_PWD} -e "SELECT user, host, password, Shutdown_priv FROM mysql.user;"

fi

mysqladmin -u root -p${MYSQL_ROOT_PWD} shutdown

exec mysqld_safe # --skip-grant-tables

# set +x

#### just a reminder ####
# mysql -u root -p --> --updade --password

#### deleted line ####
# mysql -e "FLUSH PRIVILEGES;"
# mysql -e "DELETE FROM mysql.user WHERE User='';"
# mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
