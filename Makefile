GREEN=\033[1;32m
RED=\033[1;31m
BLUE=\033[1;34m
END=\033[0m

DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all:
	@echo "$(GREEN)Building and starting all containers: $(END)"
	mkdir -p /home/$(USER)/data/wordpress
	mkdir -p /home/$(USER)/data/mariadb
	docker compose -f $(DOCKER_COMPOSE_FILE) up --detach --build

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down -v

clean:
	@if [ ! -z "$$(docker ps -aq)" ]; then \
		docker stop $$(docker ps -aq); \
		docker rm $$(docker ps -aq); \
	fi
	@if [ ! -z "$$(docker images -aq)" ]; then \
		docker rmi $$(docker images -aq); \
	fi	
	@if [ ! -z "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	@if [ ! -z "$$(docker network ls -q --filter type=custom)" ]; then \
		docker network rm $$(docker network ls -q --filter type=custom); \
	fi
	rm -rf /home/$(USER)/data/wordpress
	rm -rf /home/$(USER)/data/mariadb
	@echo "$(GREEN)Deleted all docker containers, volumes, networks, and images succesfully$(END)"

re: clean all

.PHONY: all down clean re