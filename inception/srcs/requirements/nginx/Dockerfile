FROM		debian:buster

# Install nginx, openssl and configure SSL
RUN			apt update \
			&& apt install	nginx -y \
							openssl -y \
#							vim -y \
#							curl -y \
			&& mkdir -p /etc/nginx/ssl \
			&& openssl req -x509 -nodes \
			-out /etc/nginx/ssl/inception.crt \
			-keyout /etc/nginx/ssl/inception.key \
			-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"\
			&& mkdir -p /var/run/nginx


#RUN			apt install nginx -y
#RUN			apt install vim -y
#RUN			apt install curl -y
#RUN			apt install openssl -y
#RUN			mkdir -p /etc/nginx/ssl


#COPY		conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE		443

ENTRYPOINT	["tail", "-f"]


#docker build srcs/requirements/nginx -t nginx
#docker rmi -f 013c344c8936 31fd7282cf89 7ad675a54c03 547ca0c4e784
