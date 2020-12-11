#**************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcros-mo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/30 14:34:04 by lcros-mo          #+#    #+#              #
#    Updated: 2020/12/11 14:46:54 by lcros-mo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN apt-get -y install php7.3
#RUN apt-get -y install mariadb-server
RUN apt-get -y install php-fpm
#RUN apt-get -y install php-mysql
#RUN apt-get -y install php-mbstring
#RUN apt-get -y install wget

# Configure nginx
COPY srcs/nginx/nginx.conf /etc/nginx/sites-available
#RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
#RUN rm /etc/nginx/sites-enabled/default

#php
COPY srcs/php/info.php /var/www/html
COPY srcs/php/php.ini /etc/php/7.3/fpm

#scrypts
COPY srcs/service_init.sh /
CMD bash service_init.sh
