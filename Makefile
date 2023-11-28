all: build run exec

build:
	docker build -t webserv_image .

run:
	docker run -d -p 9090-9093:9090-9093 -p 8080:8080 --name webserv_container webserv_image
##	docker run -d -p 9090:9090 --name webserv_container webserv_image

exec:
	docker exec -it webserv_container bash

stop:
	docker ps -q | xargs -I {} docker stop {}

rm:
	docker ps -aq | xargs docker rm

images:
	docker images

rm_images:
	docker images -q | xargs -I {} docker rmi -f {}

ps:
	docker ps -a

logs:
	docker ps -q | xargs -I {} docker logs {}

ip:
	docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' webserv_container

clean:
	make stop && make rm
fclean: clean
	make rm_images

re: fclean all

.PHONY: build run exec stop images rm rm_images ps logs all fclean re
