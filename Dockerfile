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
RUN a2enmod cgi

# ssl
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
RUN groupadd cit384
RUN adduser usercat
RUN usermod -aG cit384 usercat
RUN adduser userbear
RUN usermod -aG cit384 userbear

# copy files (html conf md)
COPY hosts /etc/hosts
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY mywebsite.cit384.conf /etc/apache2/sites-available/mywebsite.cit384.conf
COPY special.cit384.conf /etc/apache2/sites-available/special.cit384.conf
COPY final.cit384.conf /etc/apache2/sites-available/final.cit384.conf

COPY usercat.jpg /home/usercat/public_html/usercat.jpg
COPY userbear.jpg /home/userbear/public_html/userbear.jpg
COPY usercat.html /home/usercat/public_html/index.html
COPY userbear.html /home/userbear/public_html/index.html
COPY style.css /home/usercat/public_html/style.css
COPY style.css /home/userbear/public_html/style.css
COPY mywebsite.html /var/www/mywebsite.cit384/public_html/index.html
COPY special.html /var/www/special.cit384/public_html/index.html
COPY final.html /var/www/final.cit384/public_html/index.html

COPY .htpasswd /etc/apache2/.htpasswd
COPY .htaccess /var/www/final.cit384/public_html/submission/.htaccess
COPY submission.md /var/www/final.cit384/public_html/submission/submission.md
COPY submission.txt /home/submission.txt 

# cgi
WORKDIR /home/usercat/public_html/cgi-bin
COPY script.cgi /home/usercat/public_html/cgi-bin/script.cgi
RUN chmod a+x script.cgi
# cgi

RUN sudo chown -R $USER:$USER /var/www/mywebsite.cit384/public_html
RUN sudo chown -R $USER:$USER /var/www/special.cit384/public_html
RUN sudo chown -R $USER:$USER /var/www/final.cit384/public_html
RUN sudo chmod -R 755 /var/www

RUN sudo a2ensite mywebsite.cit384.conf
RUN sudo a2ensite special.cit384.conf
RUN sudo a2ensite final.cit384.conf

# the end uwu
LABEL Maintainer: "kimberly.rebamonte.227@my.csun.edu"
CMD ["/usr/sbin/apache2ctl","-D", "FOREGROUND"]
EXPOSE 80
EXPOSE 443