# syntax=docker/dockerfile:1

FROM composer:2 AS composer

FROM dunglas/frankenphp:latest

# Install Composer from the official image
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

# Install PHP extensions commonly required by Laravel and RabbitMQ integrations
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends librabbitmq-dev pkg-config; \
    install-php-extensions \
        bcmath \
        exif \
        gd \
        intl \
        mbstring \
        opcache \
        pcntl \
        pdo_mysql \
        pdo_pgsql \
        amqp; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# FrankenPHP serves HTTP on port 80 by default
EXPOSE 80
