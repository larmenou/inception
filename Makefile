.PHONY: start stop

start:
	mkdir -p /home/larmenou/data/vol_mariadb /home/larmenou/data/vol_wordpress
	docker-compose -f srcs/docker-compose.yml up --build -d

stop: 
	docker-compose -f srcs/docker-compose.yml down
	docker container prune -f
	rm -rf /home/larmenou/data/vol_mariadb /home/larmenou/data/vol_wordpress