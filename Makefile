
all:
	@printf "Launch configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/mkdir_data.sh
	@bash srcs/requirements/nginx/tools/make_cert.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@printf "Building configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/mkdir_data.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

logs:
	@docker-compose -f ./srcs/docker-compose.yml logs
re:
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ~/data/portainer/*

fclean: down
	@printf "Total clean of all configurations docker\n"
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@rm -rf srcs/requirements/nginx/tools/*.42.fr*
	@sudo rm -rf ~/data

.PHONY	: all build down re clean fclean
