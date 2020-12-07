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

RUN apt-get update && apt-get install -y \
    nginx \
    mariadb-server \
    php-fpm \
    php-mysql \
    php-mbstring \
    wget \
    
RUN service nginx start
RUN cp /src/nginx/server.conf /etc/nginx/sites-available/localhost

EXPOSE 80 443
