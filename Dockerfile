# 16-proxy-server lab

# Base and Modules
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y apt-utils
RUN apt-get install -y vim
RUN apt-get install -y sudo
RUN apt install -y curl
RUN a2enmod userdir
RUN a2enmod autoindex
RUN a2enmod rewrite
RUN a2enmod alias
RUN a2enmod auth_basic
RUN a2enmod ssl
RUN a2enmod headers
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod deflate
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN a2enmod proxy_hcheck

RUN openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj \
    "/C=US/ST=CA/L=Los Angeles/O=csun_owo/OU=uwu/CN=server_IP_address" \
    -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt

# Create 2 users
RUN adduser cat1
RUN passwd -d cat1
RUN usermod -aG sudo cat1
RUN adduser bear2
RUN passwd -d bear2
RUN usermod -aG sudo bear2

# copy config files
COPY index.html /var/www/site1/public_html/index.html
COPY index.html /var/www/site2/public_html/index.html
COPY index.html /var/www/site3/public_html/index.html
COPY hosts /etc/hosts
COPY site1.conf /etc/apache2/sites-available/site1.conf
COPY site2.conf /etc/apache2/sites-available/site2.conf
COPY site3.conf /etc/apache2/sites-available/site3.conf
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

# pages
COPY index.html /var/www/site1.internal/public_html
COPY tired.html /var/www/site2.internal/public_html
COPY exhausted.html /var/www/site3.internal/public_html/special
ADD /images /var/www/site1.internal/public_html/images
ADD /images /var/www/site2.internal/public_html/images
ADD /images /var/www/site3.internal/public_html/images

RUN sudo chown -R $USER:$USER /var/www/site1.internal/public_html
RUN sudo chown -R $USER:$USER /var/www/site2.internal/public_html
RUN sudo chown -R $USER:$USER /var/www/site3.internal/public_html
RUN sudo chmod -R 755 /var/www

RUN sudo a2ensite site1.conf
RUN sudo a2ensite site2.conf
RUN sudo a2ensite site3.conf

# the end uwu
LABEL Maintainer: "kimberly.rebamonte.227@my.csun.edu"
CMD ["/usr/sbin/apache2ctl","-D", "FOREGROUND"]
EXPOSE 80