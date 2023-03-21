#	docker-compose -f  srcs/docker-compose.yml -p inception build
# all : build

# build :
# 	docker-compose -f ./srcs/docker-compose.yml build \
# 	&& docker-compose -f ./srcs/docker-compose.yml up -d

# down :
# 	docker-compose -f ./srcs/docker-compose.yml down

# clean :
# 	make down \
# 	&& docker system prune -af \
# 	&& docker volume rm srcs_mariadb srcs_wordpress

# re : down clean build

# .PHONY : build down re rmi


all : build

build :
	sudo docker-compose -f ./srcs/docker-compose.yml build \
	&& sudo docker-compose -f ./srcs/docker-compose.yml up -d


down :
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean :
	make down \
	&& sudo docker system prune -a \
	&& sudo docker volume rm srcs_mariadb srcs_wordpress

re : down clean build

.PHONY : build down re rmi
