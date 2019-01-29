FROM nginx:alpine

RUN addgroup -g 1000 -S www-data \
    && adduser -u 1000 -D -S -G www-data www-data

COPY ./docker/nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www/html