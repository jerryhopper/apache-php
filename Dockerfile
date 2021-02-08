FROM        jerryhopper/apache
MAINTAINER  JerryHopper "hopper.jerry@gmail.com"

USER root


# Install Apache with PHP
#libapache2-modsecurity \
#                       libapache2-mod-php \

RUN apt-get update && \
    apt-get install -y php-cli \
                       php \
#                       php-mail \
#                       php-json \
                       php-readline \
                       php-redis \
#                       php-memcache \
#                       php-apcu \
#                       php-mcrypt \
                       php-curl \
#                       php-gd \
#                       php-pgsql \
#                       php-mysql \
                       php-soap  && \
      apt-get clean && rm -rf /tmp/* /var/tmp/*

ADD rootfs /
RUN chmod +x /start

RUN phpenmod security && \
    phpenmod short-open-tag && \
    phpenmod uploads && \
    phpenmod soap && \
    a2enmod mpm_prefork 
#    a2enmod security2




