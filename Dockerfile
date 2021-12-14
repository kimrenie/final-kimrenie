# final

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
RUN a2enmod status
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod deflate
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
RUN a2enmod proxy_hcheck
RUN a2enmod lbmethod_byrequests
RUN cgi

#ssl
RUN openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj \
    "/C=US/ST=CA/L=Los Angeles/O=csun_owo/OU=uwu/CN=server_IP_address" \
    -keyout /etc/ssl/mywebsite-selfsigned.key -out /etc/ssl/certs/mywebsite-selfsigned.crt

RUN openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj \
    "/C=US/ST=CA/L=Los Angeles/O=csun_owo/OU=uwu/CN=server_IP_address" \
    -keyout /etc/ssl/special-selfsigned.key -out /etc/ssl/certs/special-selfsigned.crt

RUN openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj \
    "/C=US/ST=CA/L=Los Angeles/O=csun_owo/OU=uwu/CN=server_IP_address" \
    -keyout /etc/ssl/final-selfsigned.key -out /etc/ssl/certs/final-selfsigned.crt

# create group and users
RUN adduser usercat
RUN passwd -d usercat
RUN usermod -aG sudo usercat
RUN adduser userbear
RUN passwd -d userbear
RUN usermod -aG sudo userbear
RUN groupadd cit384

# copy files (html conf md)
# COPY hosts /etc/hosts
# COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY mywebsite.cit384 /etc/apache2/sites-availablemywebsite.cit384
COPY special.cit384 /etc/apache2/sites-available/special.cit384
COPY final.cit384 /etc/apache2/sites-available/final.cit384

COPY usercat.html /home/usercat/public_html/usercat.html
COPY userbear.html /home/userbear/public_html/userbear.html
COPY mywebsite.html /var/www/mywebsite.cit384/public_html/mywebsite.html
COPY special.html /var/www/special.cit384/public_html/special.html

COPY submission.txt /home/submission.txt
COPY submission.md /var/www/final.cit384/public_html/final.html
COPY .htaccess /var/www/html/final.cit384/submission
COPY .htpasswd /usr/local/bin
COPY .htpasswd /home/submission.txt

RUN sudo chown -R $USER:$USER /var/www/mywebsite.384/public_html
RUN sudo chown -R $USER:$USER /var/www/special.cit384/public_html
RUN sudo chown -R $USER:$USER /var/www/final.cit384/public_html
RUN sudo chmod -R 755 /var/www

####################################

# parts 7 8 9 10 go here

RUN sudo a2ensite mywebsite.cit384
RUN sudo a2ensite special.cit384
RUN sudo a2ensite final.cit384

#############################################

# the end uwu
LABEL Maintainer: "kimberly.rebamonte.227@my.csun.edu"
CMD ["/usr/sbin/apache2ctl","-D", "FOREGROUND"]
EXPOSE 80
EXPOSE 443