export MYSQL_DATABASE=Wordpress
export MYSQL_ROOT_PWD=MariadbRootPwd
export MYSQL_USER=MariadbUser
export MYSQL_PWD=MariadbPwd


service mysql start;

mysql -u root -p${MYSQL_ROOT_PWD} -e "UPDATE mysql.user  SET Password='${MYSQL_ROOT_PWD}' WHERE User='root';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -u root -p${MYSQL_ROOT_PWD} -e "SELECT user, host, password, Shutdown_priv FROM mysql.user;"
mysql -u root -p${MYSQL_ROOT_PWD} -e "FLUSH PRIVILEGES;"
killall -15 mysqld
# mysqladmin --user=root -p=${MYSQL_ROOT_PWD} shutdown
echo couocou
sleep 5 && exec mysqld_safe

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
