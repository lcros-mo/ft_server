#**************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcros-mo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/30 14:34:04 by lcros-mo          #+#    #+#              #
#    Updated: 2020/12/12 14:29:13 by lcros-mo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN apt-get -y install php7.3
RUN apt-get -y install mariadb-server
RUN apt-get -y install php-fpm
RUN apt-get -y install php-mysql
#RUN apt-get -y install php-mbstring
#RUN apt-get -y install wget

# Configure nginx
COPY srcs/nginx/localhost.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/localhost.conf /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

#phpMyAdmin configuration
ADD https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz .
RUN tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.7-all-languages /var/www/html/phpmyadmin

#php
COPY srcs/php/info.php /var/www/html
COPY srcs/php/php.ini /etc/php/7.3/fpm

#wordpress
ADD https://wordpress.org/latest.tar.gz .
RUN tar xvf latest.tar.gz
RUN mv wordpress /var/www/html/
RUN rm -rf latest.tar.gz
COPY srcs/wordpress/wp-config.php /var/www/html/wordpress
RUN	chown -R www-data:www-data /var/www/html

#scrypts
COPY srcs/service_init.sh /
CMD bash service_init.sh
