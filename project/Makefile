name = inception
all:
	@printf "Launch configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@printf "Building configuration ${name}...\n"
#	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

ps:
	@printf "View configuration\n"
	@docker-compose -f ./srcs/docker-compose.yml ps

test:
	@printf "Run test scripts\n"
	@bash srcs/check.sh

re: down
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

reall: down
	@printf "Rebuild all all\n"
	@sudo rm -rf ./data/database/* ./data/www/* ./data/logs/* ./data/prometheus_data/*
	@docker system prune -a
	@make build
	@sudo chmod -R 777 ./data

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean
