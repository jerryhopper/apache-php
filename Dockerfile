FROM        jerryhopper/apache
MAINTAINER  JerryHopper "hopper.jerry@gmail.com"

USER root


# Install Apache with PHP
#libapache2-modsecurity \
#                       libapache2-mod-php \
#                       php-mcrypt \


RUN apt-get update && apt-cache search modsecurity 

RUN apt-get update && \
    apt-get install -y libapache2-mod-php \
                       php-cli \
                       php \
                       php-mail \
                       php-json \
                       php-readline \
                       php-redis \
                       php-memcache \
                       php-apcu \
                       php-curl \
                       php-gd \
                       php-pgsql \
                       php-mysql \
                       php-soap  && \
      apt-get clean && rm -rf /tmp/* /var/tmp/*

ADD rootfs /
RUN chmod +x /start

# phpenmod short-open-tag && \
RUN phpenmod phpenmod uploads && \
    phpenmod soap && \
    a2enmod mpm_prefork \
#    security && \
#    a2enmod security2




