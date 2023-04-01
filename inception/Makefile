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
	mkdir ~/data/mariadb -p \
	&& mkdir ~/data/wordpress -p \
	&& sudo docker-compose -f ./srcs/docker-compose.yml build \
	&& sudo docker-compose -f ./srcs/docker-compose.yml up -d

down :
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean :
	make down \
	&& sudo docker system prune -af \
	&& sudo docker volume rm srcs_mariadb srcs_wordpress \

vclean :
	sudo rm -rf ~/data/mariadb  \
	&& sudo mkdir ~/data/wordpress

fclean :
	make clean \
	&& make clean



checklogs :
	@echo " ~~~~ nginx logs ~~~~"
	docker logs nginx
	@echo " ~~~~ mariadb logs ~~~~"
	docker logs mariadb
	@echo " ~~~~ wordpress logs ~~~~"
	docker logs wordpress

re : down clean build

.PHONY : build down re rmi
