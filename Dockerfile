FROM debian:buster

ENV ASAN_OPTIONS=detect_leaks=1

RUN apt-get -y update && apt-get -y upgrade \
	&& apt update -y && apt upgrade -y \
	&&  apt-get install -y make vim g++ curl siege

COPY ./webserv /webserv
COPY ./tools/script.sh /
#COPY ./webserv/config/example.conf /config
#COPY ./webserv/config/hardcode.conf /config

RUN chmod -R 755 /webserv

WORKDIR /webserv

EXPOSE 9090 9091 9092 9093 8080

ENTRYPOINT ["/script.sh"]
