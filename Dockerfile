# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bodysseu <bodysseu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/28 17:13:54 by bodysseu          #+#    #+#              #
#    Updated: 2020/08/04 01:39:10 by bodysseu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster
LABEL 	maintainer="Brittaney Odysseus <bodysseu@student.42.fr>"

#work directory for project
WORKDIR	/var/www/localhost

#install updates
RUN		apt-get update && \
		apt-get -y dist-upgrade && \
		apt-get clean

#installation
RUN		apt-get install -y \
		nginx \
		php7.3-fpm php7.3-mysql php7.3-curl \
		php7.3-gd php7.3-intl php7.3-mbstring php7.3-soap php7.3-xml php7.3-xmlrpc php7.3-zip \
		mariadb-server \
		wget \
		curl

#set timezone for server
ENV 	TZ=Europe/Moscow
RUN 	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#info php
RUN		touch /var/www/localhost/info.php
RUN		echo "<?php phpinfo(); ?>" >> /var/www/localhost/info.php

#ssl
RUN 	mkdir /etc/nginx/ssl
RUN 	openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem \
		-keyout /etc/nginx/ssl/localhost.key \
		-subj "/C=RU/ST=Moscow/L=Moscow/O=21/OU=bodysseu/CN=localhost"

# nginx config
COPY	srcs/localhost  /etc/nginx/sites-available/localhost
RUN		ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN		rm -rf /etc/nginx/sites-enabled/default

# wordpress
RUN 	wget https://wordpress.org/latest.tar.gz
RUN		tar -xzf latest.tar.gz --strip-components 1 -C /var/www/localhost && rm -f latest.tar.gz
COPY 	srcs/wp-config.php .

#phpmyadmin
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.xz
RUN		tar -xf phpMyAdmin-4.9.5-all-languages.tar.xz && \
		rm -f phpMyAdmin-4.9.5-all-languages.tar.xz && \
		mv phpMyAdmin-4.9.5-all-languages phpmyadmin
COPY 	srcs/config.inc.php phpmyadmin

#mysql root privileges
RUN 	service mysql start && \
		mysql -e "CREATE DATABASE wordpress" && \
		mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" && \
		mysql -e "update mysql.user set plugin='mysql_native_password' where user='root';" && \
		mysql -e "FLUSH PRIVILEGES;"

#load wordpress site data
COPY 	srcs/wordpress.sql ./
RUN 	service mysql start && \
		mysql wordpress -u root --password=  < /var/www/localhost/wordpress.sql && \
		rm -f wordpress.sql
COPY    srcs/img_dir/. wp-content/uploads/

#grand acces
RUN 	chown -R www-data:www-data /var/www/localhost/* && \
		chmod -R 755 /var/www/localhost/*

COPY 	srcs/autoindex.sh .

RUN 	apt-get install -y unzip && \
		wget https://files.phpmyadmin.net/themes/fallen/0.7.1/fallen-0.7.1.zip && \
		unzip -q fallen-0.7.1.zip && rm -f fallen-0.7.1.zip && \
		mv fallen phpmyadmin/themes

#service start
CMD 	service php7.3-fpm start && service mysql start && service nginx start && bash