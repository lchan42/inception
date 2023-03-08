FROM		debian:buster

# Install nginx + openssl and configure them
RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get install nginx -y openssl -y \
			&& mkdir -p /var/run/nginx \
			&& mkdir -p /etc/nginx/ssl \
			&& openssl req -x509 -nodes \
			-out /etc/nginx/ssl/lchan.42.fr.crt \
			-keyout /etc/nginx/ssl/lchan.42.fr.key \
			-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lchan.42.fr/UID=lchan"
RUN			chmod 755 /var/www
RUN			chown -R www-data:www-data /var/www
RUN			chmod 755 /var/www/html
RUN			chown -R www-data:www-data /var/www/html


			# && mkdir -p /var/www/wordpress\

# copy our configuration file into nginx container
COPY		conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE		443

# Runing nginx foreground prevent container from going off
CMD	[ "nginx", "-g", "daemon off;" ]

#for SSL config :
#	RUN openssl
#	[req]	= creat form
#	[-node]	= no password
#	[-out]	= destination for the certificate
#	[-key]	= destination for the key file
#	[-subj] = pre-fill certificate

# commande
# docker build srcs/requirements/nginx -t nginx
# docker rmi -f 013c344c8936 31fd7282cf89 7ad675a54c03 547ca0c4e784
# docker system prune -a -f && docker build srcs/requirements/nginx -t nginx && docker run -d -it nginx
# docker system prune -a -f && docker build srcs/requirements/nginx -t nginx && docker run -d -p 42421:443 -it nginx
