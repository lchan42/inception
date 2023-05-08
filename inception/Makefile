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
	rm srcs/.env && cp ~/Document/.env srcs/ \
	&& mkdir ~/data/mariadb -p \
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
	&& sudo rm -rf ~/data/wordpress

fclean :
	make clean \
	&& make vclean

checklogs :
	@echo " ~~~~ docker logs nginx ~~~~"
	@docker logs nginx
	@echo " ~~~~ docker logs mariadb logs ~~~~"
	@docker logs mariadb
	@echo " ~~~~ docker logs wordpress logs ~~~~"
	@docker logs wordpress


re : down clean build

.PHONY : build down re rmi
