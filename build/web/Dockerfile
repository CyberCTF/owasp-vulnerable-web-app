# Vulnerable Web Application ships no Dockerfile (upstream: copy the files into a XAMPP htdocs or
# /var/www/html, set allow_url_include and allow_url_fopen on, then press "Create Database" on
# index.php). This image does that on PHP 7.4 with Apache (PHP 8.1 and later turn mysqli errors
# into exceptions, which breaks the SQL injection pages): the source from app/ goes to
# /var/www/html/, the hardcoded database host 'localhost' is changed to the db machine in the
# copied files (the account stays root with no password), and the command first starts
# setup-db.sh in the background, which presses "Create Database" once so the lab starts ready.
FROM docker.io/library/php:7.4-apache

RUN docker-php-ext-install mysqli \
 && printf 'allow_url_include = On\nallow_url_fopen = On\n' > /usr/local/etc/php/conf.d/vwa.ini

COPY --chown=www-data:www-data app/ /var/www/html/
RUN sed -i -e "s/\$dbhost = 'localhost';/\$dbhost = 'db';/" /var/www/html/index.php \
 && sed -i -e 's/\$servername = "localhost";/$servername = "db";/' /var/www/html/SQL/*.php \
 && ! grep -rn "localhost" /var/www/html/index.php /var/www/html/SQL

COPY setup-db.sh /usr/local/bin/vwa-setup-db
CMD ["sh", "-c", "sh /usr/local/bin/vwa-setup-db & exec apache2-foreground"]
