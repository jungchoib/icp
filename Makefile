all:
	@mkdir -p /home/junghych/data/www
	@mkdir -p /home/junghych/data/mysql
	docker-compose -f ./srcs/docker-compose.yml up --detach --build
	@echo "\n\n*** Server is running on http://junghych.42.fr ***\n\n"

re:
	docker-compose -f ./srcs/docker-compose.yml down -v
	@echo "\n\n*** Server is restarting... ***\n\n"
	docker-compose -f ./srcs/docker-compose.yml up --detach --build
	@echo "\n\n*** Server is running on http://junghych.42.fr ***\n\n"

clean:
	docker-compose -f ./srcs/docker-compose.yml down
	@echo "\n\n*** Server is stopped ***\n\n"
	docker system prune -af
	@echo "\n\n*** Images are removed ***\n\n"

fclean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	@echo "\n\n*** Server is stopped ***\n\n"
	# docker system prune --all --force --volumes
	docker system prune --af
	@echo "\n\n*** Images and volumes are removed ***\n\n"
	@sudo rm -rf /home/junghych/data

info:
		@echo "[ IMAGES ]"
		@docker images
		@echo
		@echo "[ CONTAINERS ]"
		@docker ps -a
		@echo
		@echo "[ NETWORKS ]"
		@docker network ls
		@echo
		@echo "[ VOLUMES ]"
		@docker volume ls

.PHONY	: all build down re clean fclean info