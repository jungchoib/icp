DEFAULT = \033[0m
CYAN = \033[0;36m

all:
	@mkdir -p /home/seed/data/www
	@mkdir -p /home/seed/data/mysql
	docker-compose -f ./srcs/docker-compose.yml up --detach --build
	@echo "\n\n*** $(CYAN)Server is running on http://seed.42.fr$(DEFAULT) ***\n\n"

re:
	docker-compose -f ./srcs/docker-compose.yml down
	@echo "\n\n*** $(CYAN)Server is restarting...$(DEFAULT) ***\n\n"
	docker-compose -f ./srcs/docker-compose.yml up --detach --build
	@echo "\n\n*** $(CYAN)Server is running on http://seed.42.fr$(DEFAULT) ***\n\n"

clean:
	docker-compose -f ./srcs/docker-compose.yml down
	@echo "\n\n*** $(CYAN)Server is stopped$(DEFAULT) ***\n\n"
	docker system prune -af
	@echo "\n\n*** $(CYAN)Images are removed$(DEFAULT) ***\n\n"

fclean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	@echo "\n\n*** $(CYAN)Server is stopped$(DEFAULT) ***\n\n"
	docker system prune --all --force --volumes
	@echo "\n\n*** $(CYAN)Images and volumes are removed$(DEFAULT) ***\n\n"
	@sudo rm -rf /home/seed/data

info:
		@echo "$(CYAN)[ IMAGES ]$(DEFAULT)"
		@docker images
		@echo
		@echo "$(CYAN)[ CONTAINERS ]$(DEFAULT)"
		@docker ps -a
		@echo
		@echo "$(CYAN)[ NETWORKS ]$(DEFAULT)"
		@docker network ls
		@echo
		@echo "$(CYAN)[ VOLUMES ]$(DEFAULT)"
		@docker volume ls

.PHONY	: all build down re clean fclean info