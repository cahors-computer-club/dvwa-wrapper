FROM php:5.6-apache-stretch

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN apt update -y && apt upgrade -y && apt install -y git mariadb-server libpng-dev python3 python3-pip && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install mysql && docker-php-ext-install mysqli && docker-php-ext-install pdo_mysql && docker-php-ext-install gd

RUN pip3 install j2cli

RUN rm -rf /var/www/html
RUN git clone https://github.com/ethicalhack3r/DVWA.git /var/www/html

RUN rm -f /var/www/html/php.ini /usr/local/etc/php/php.ini
COPY templates /templates
COPY files/php.ini /usr/local/etc/php/php.ini

RUN chown www-data:www-data -R /var/www/html

WORKDIR /var/www/html

ENV DVWA_DIFFICULTY medium
ENV RECAPTCHA_KEY ""

EXPOSE 80

COPY files/run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD ["/usr/local/bin/run.sh"]