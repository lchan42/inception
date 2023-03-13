

echo "hello from MAria"

export MYSQL_DATABASE=Wordpress
export MYSQL_ROOT_PWD=MariadbRootPwd
export MYSQL_USER=MariadbUser
export MYSQL_PWD=MariadbPwd




service mysql start;
mysql -e " --user=root mysql"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
echo "hello 5"

mysql -e "UPDATE mysql.user SET Password='${MYSQL_ROOT_PWD}' WHERE User='root';"
echo "hello 6"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
mysql -e "FLUSH PRIVILEGES;"
echo "hello 7"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
# mysql -e "FLUSH PRIVILEGES;"
# killall -15 mysqld
mysqladmin -u root -p$MYSQL_ROOT_PWD shutdown
echo "hello 8"
# service mysql -u -root -p start ;
# systemctl start mysqld;
exec mysqld_safe
echo "hello 9"
echo "goodbye"

#### just a reminder ####
# mysql -u root -p --> --updade --password


# service mysql start;
# echo "hello 1"
# mysql -e " --user=root mysql"
# echo "hello 2"
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# echo "hello 3"
# mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PWD}';"
# echo "hello 4"
# mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
# echo "hello 5"
# mysql -e "UPDATE mysql.user SET Password=${MYSQL_ROOT_PWD} WHERE User='root';"
# echo "hello 6"
# mysql -e "FLUSH PRIVILEGES;"
# echo "hello 7"
# # mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
# # mysql -e "FLUSH PRIVILEGES;"
# # killall -15 mysqld
# mysqladmin -u root -p $MYSQL_ROOT_PWD shutdown
# echo "hello 8"
# # service mysql -u -root -p start ;
# # systemctl start mysqld;
# exec mysqld_safe
# echo "hello 9"
# echo "goodbye"

# #### just a reminder ####
# # mysql -u root -p --> --updade --password
