FROM alpine:3.12

LABEL Maintainer="Maciej Śliwiński <m.sliwinski@sportowysklep.pl>" \
      Description="alpine && php7 && nginx"

RUN apk update && apk upgrade
RUN apk --no-cache add php7 php7-fpm php7-opcache php7-mysqli php7-json php7-openssl php7-curl php7-soap \
    php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-simplexml php7-pdo php7-pdo_mysql php7-tokenizer \
    php7-mbstring php7-gd nginx supervisor curl curl-dev openssl openssl-dev git php7-exif php7-zip php7-pecl-imagick php7-xmlwriter php7-pecl-memcached tzdata htop nano mysql-client \
    php7-pear php7-dev gcc musl-dev make bash openssh && \
    rm /etc/nginx/conf.d/default.conf

RUN pecl channel-update pecl.php.net && \
    pecl install mongodb redis

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN apk add nodejs npm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
RUN chmod u+x ~/.nvm/nvm.sh
RUN ~/.nvm/nvm.sh install 14.3.0 -y

COPY ./config/nginx.conf /etc/nginx/nginx.conf

COPY ./config/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY ./config/php.ini /etc/php7/conf.d/custom.ini

COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir -p /app
RUN mkdir -p /var/www/html

RUN mkdir -p /.composer
RUN mkdir -p /.npm

RUN chown -R nobody.nobody /app && \
  chown -R nobody.nobody /var/www/html && \
  chown -R nobody.nobody /.composer && \
  chown -R nobody.nobody /.npm && \
  chown -R nobody.nobody /run && \
  chown -R nobody.nobody /var/lib/nginx && \
  chown -R nobody.nobody /var/log/nginx

USER nobody

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping