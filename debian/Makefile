# DEFAULT = \033[0m
# CYAN = \033[0;36m

# all:
# 	@mkdir -p /home/seed/data/www
# 	@mkdir -p /home/seed/data/mysql
# 	docker-compose -f ./srcs/docker-compose.yml up --detach --build
# 	@echo "\n\n*** $(CYAN)Server is running on http://seed.42.fr$(DEFAULT) ***\n\n"

# re:
# 	docker-compose -f ./srcs/docker-compose.yml down
# 	@echo "\n\n*** $(CYAN)Server is restarting...$(DEFAULT) ***\n\n"
# 	docker-compose -f ./srcs/docker-compose.yml up --detach --build
# 	@echo "\n\n*** $(CYAN)Server is running on http://seed.42.fr$(DEFAULT) ***\n\n"

# clean:
# 	docker-compose -f ./srcs/docker-compose.yml down
# 	@echo "\n\n*** $(CYAN)Server is stopped$(DEFAULT) ***\n\n"
# 	docker system prune -af
# 	@echo "\n\n*** $(CYAN)Images are removed$(DEFAULT) ***\n\n"

# fclean:
# 	docker-compose -f ./srcs/docker-compose.yml down -v
# 	@echo "\n\n*** $(CYAN)Server is stopped$(DEFAULT) ***\n\n"
# 	docker system prune --all --force --volumes
# 	@echo "\n\n*** $(CYAN)Images and volumes are removed$(DEFAULT) ***\n\n"
# 	@sudo rm -rf /home/seed/data

# info:
# 		@echo "$(CYAN)[ IMAGES ]$(DEFAULT)"
# 		@docker images
# 		@echo
# 		@echo "$(CYAN)[ CONTAINERS ]$(DEFAULT)"
# 		@docker ps -a
# 		@echo
# 		@echo "$(CYAN)[ NETWORKS ]$(DEFAULT)"
# 		@docker network ls
# 		@echo
# 		@echo "$(CYAN)[ VOLUMES ]$(DEFAULT)"
# 		@docker volume ls

# .PHONY	: all build down re clean fclean info

# ANSI 색상 코드 정의
DEFAULT = \033[0m
CYAN = \033[0;36m

# 기본 타겟
all:
	@mkdir -p /home/subinlee/data/www  # 웹 데이터 디렉토리 생성
	@mkdir -p /home/subinlee/data/mysql  # MySQL 데이터 디렉토리 생성
	docker-compose -f ./srcs/docker-compose.yml up --detach --build  # Docker Compose로 서비스 시작
	@echo "\n\n*** $(CYAN)Server is running on http://subinlee.42.fr$(DEFAULT) ***\n\n"  # 서버 실행 메시지

# 서버 재시작 타겟
re:
	docker-compose -f ./srcs/docker-compose.yml down  # 현재 실행 중인 서비스 중지
	@echo "\n\n*** $(CYAN)Server is restarting...$(DEFAULT) ***\n\n"  # 재시작 메시지
	docker-compose -f ./srcs/docker-compose.yml up --detach --build  # Docker Compose로 서비스 재시작
	@echo "\n\n*** $(CYAN)Server is running on http://subinlee.42.fr$(DEFAULT) ***\n\n"  # 서버 실행 메시지

# 서버 정지 타겟
clean:
	docker-compose -f ./srcs/docker-compose.yml down  # 현재 실행 중인 서비스 중지
	@echo "\n\n*** $(CYAN)Server is stopped$(DEFAULT) ***\n\n"  # 서버 중지 메시지
	docker system prune -af  # 사용하지 않는 Docker 리소스 정리
	@echo "\n\n*** $(CYAN)Images are removed$(DEFAULT) ***\n\n"  # 이미지 제거 메시지

# 서버 정지 및 볼륨 제거 타겟
fclean:
	docker-compose -f ./srcs/docker-compose.yml down -v  # 현재 실행 중인 서비스 중지 및 볼륨 제거
	@echo "\n\n*** $(CYAN)Server is stopped$(DEFAULT) ***\n\n"  # 서버 중지 메시지
	docker system prune --all --force --volumes  # 모든 Docker 리소스 및 볼륨 정리
	@echo "\n\n*** $(CYAN)Images and volumes are removed$(DEFAULT) ***\n\n"  # 이미지 및 볼륨 제거 메시지
	@sudo rm -rf /home/subinlee/data  # 데이터 디렉토리 삭제

# Docker 정보 출력 타겟
info:
	@echo "$(CYAN)[ IMAGES ]$(DEFAULT)"  # 이미지 목록 제목
	@docker images  # Docker 이미지 목록 출력
	@echo
	@echo "$(CYAN)[ CONTAINERS ]$(DEFAULT)"  # 컨테이너 목록 제목
	@docker ps -a  # 모든 Docker 컨테이너 목록 출력
	@echo
	@echo "$(CYAN)[ NETWORKS ]$(DEFAULT)"  # 네트워크 목록 제목
	@docker network ls  # Docker 네트워크 목록 출력
	@echo
	@echo "$(CYAN)[ VOLUMES ]$(DEFAULT)"  # 볼륨 목록 제목
	@docker volume ls  # Docker 볼륨 목록 출력

.PHONY: all re clean fclean info  # 가상 타겟 선언
