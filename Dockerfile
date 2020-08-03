FROM debian:buster

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install nano 
RUN apt-get install mariadb-server -y
RUN apt-get install wget -y
RUN apt-get install php-fpm php-mysql php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y
RUN apt-get install curl -y

COPY ./srcs/script_istall.sh ./
COPY ./srcs/your_domain ./
COPY ./srcs/nginx.conf ./
COPY ./srcs/phpmyadmin.inc.php ./
COPY ./srcs/wp-config.php ./
COPY ./srcs/autoindex.sh ./
CMD bash script_istall.sh
EXPOSE 80 443
