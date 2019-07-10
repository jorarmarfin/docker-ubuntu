FROM ubuntu:16.04

# Environments vars
ENV TERM=xterm
ENV DEBIAN_FRONTEND noninteractive

EXPOSE 9001
EXPOSE 80

RUN apt-get update && apt-get -y upgrade; \
apt-get install -y vim jq python3 python3-venv wget cron apache2 curl lynx-cur supervisor ffmpeg; \
a2enmod rewrite; \
a2enmod proxy; \
a2enmod proxy_http; 

ADD ./files/apache-virtual-hosts.conf /etc/apache2/sites-enabled/000-default.conf
ADD ./files/apache2.conf /etc/apache2/apache2.conf
ADD ./files/ports.conf /etc/apache2/ports.conf
ADD ./files/envvars /etc/apache2/envvars
ADD ./files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN service apache2 restart \
chown -R www-data:www-data /var/www

# Volume
VOLUME /var/www

# Ports: apache2

CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

