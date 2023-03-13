

echo "hello from MAria"

export MYSQL_DATABASE=Wordpress
export MYSQL_ROOT_PWD=MariadbRootPwd
export MYSQL_USER=MariadbUser
export MYSQL_PWD=MariadbPwd


service mysql start;
echo "hello 1"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
echo "hello 2"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PWD}';"
echo "hello 3"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
echo "hello 4"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
echo "hello 5"
mysql -e "FLUSH PRIVILEGES;"
echo "hello 6"
mysqladmin -u root -p$MYSQL_ROOT_PWD shutdown
echo "hello 7"
echo "goodbye from MAria"

cd /var/run/mysqld && ls
# exec mysqld_safe
