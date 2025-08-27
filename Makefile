.PHONY: build up down logs clean

build:
	cd ./srcs && docker-compose --env-file .env build

up:
	cd ./srcs && docker-compose up -d

down:
	cd ./srcs && docker-compose down

logs:
	cd ./srcs && docker-compose logs -f

clean: down
	docker volume prune -f
	docker network prune -f
	docker image prune -f
	docker builder prune -a -f