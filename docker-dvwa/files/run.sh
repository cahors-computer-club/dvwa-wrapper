#!/bin/bash

# ls -lRa /templates

# env

j2 -o /var/www/html/config/config.inc.php /templates/config.inc.php.j2

# rm -rf /templates

docker-php-entrypoint apache2-foreground