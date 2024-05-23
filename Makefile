COMPOSE_FILE = ./srcs/docker-compose.yml

# Cible pour démarrer les conteneurs
all:
	@mkdir -p /home/larmenou/data/vol_wordpress
	@mkdir -p /home/larmenou/data/vol_mariadb
	docker compose -f $(COMPOSE_FILE) build
	docker compose -f $(COMPOSE_FILE) up -d

# Cible pour arrêter les conteneurs
stop:
	docker compose -f $(COMPOSE_FILE) stop

# Cible pour supprimer les conteneurs, les images et les volumes
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



# all:
# 	@mkdir -p /home/larmenou/data/vol_wordpress
# 	@mkdir -p /home/larmenou/data/vol_mariadb
# 	docker compose -f ./srcs/docker-compose.yml up --build -d

# stop:
# 	docker compose -f ./srcs/docker-compose.yml stop

# clean:
# 	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes
# 	rm -rf /home/larmenou/data/*

# re: 
# 	docker compose -f ./srcs/docker-compose.yml up --build -d

# .PHONY: all re down clean