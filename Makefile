.PHONY: build up down logs clean

build:
	cd ./srcs && docker-compose --env-file .env up -d --build



up:
	cd ./srcs && docker-compose up -d

down:
	cd ./srcs && docker-compose down

logs:
	cd ./srcs && docker-compose logs -f

clean: down
	docker volume prune -f
