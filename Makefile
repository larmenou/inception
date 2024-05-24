COMPOSE_FILE = ./srcs/docker-compose.yml

all:
	@mkdir -p /home/larmenou/data/vol_wordpress
	@mkdir -p /home/larmenou/data/vol_mariadb
#	docker compose -f $(COMPOSE_FILE) build
	docker compose -f $(COMPOSE_FILE) up --build -d

stop:
	docker compose -f $(COMPOSE_FILE) stop

down:
	@docker stop $$(docker ps -qa)
	docker rm $$(docker ps -qa)
	docker rmi -f $$(docker images -qa)
	docker volume rm srcs_vol_mariadb
	docker volume rm srcs_vol_wordpress
	docker network rm srcs_inception
	docker system prune -f
	sudo rm -rf /home/larmenou/data/*

re: down all

.PHONY: all re down stop