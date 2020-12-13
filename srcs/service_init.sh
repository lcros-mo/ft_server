# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    service_init.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lcros-mo <lcros-mo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 12:33:34 by lcros-mo          #+#    #+#              #
#    Updated: 2020/12/13 14:51:59 by lcros-mo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
service nginx start
service mysql start
service php7.3-fpm start

# Configure a wordpress database
echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

#Autoindex
if [ "$AUTOINDEX" = "on" ]
	then mv /var/www/html/index.nginx-debian.html /var/www/html/lmao ;
	else unlink /etc/nginx/sites-enabled/localhost.conf ;
		 ln -s /etc/nginx/sites-enabled/localhost.conf /etc/nginx/sites-available; fi
service nginx restart
bash
