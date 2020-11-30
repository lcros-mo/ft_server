# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcros-mo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/30 14:34:04 by lcros-mo          #+#    #+#              #
#    Updated: 2020/11/30 14:34:11 by lcros-mo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV AUTOINDEX on

RUN apt-get update && apt-get install -y \
    nginx \
    mariadb-server \
    php-fpm \
    php-mysql \
    php-mbstring \
    wget \
    
RUN     echo "daemon off;" >> /etc/nginx/nginx.conf && \ 
        rm var/www/html/index.nginx-debian.html
