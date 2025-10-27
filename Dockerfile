FROM php:8.2-fpm

# Installation des dépendances système
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    libzip-dev \
    libicu-dev \
    nodejs \
    npm \
    && docker-php-ext-install \
    pdo \
    pdo_pgsql \
    pgsql \
    zip \
    intl \
    opcache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copier la configuration OPcache
COPY docker/php/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configuration du répertoire de travail
WORKDIR /var/www/empirebtp

# Copie des fichiers du projet
COPY . .

# Installation des dépendances PHP
RUN composer install --no-interaction --optimize-autoloader --no-dev || true

# Permissions
RUN chown -R www-data:www-data /var/www/empirebtp

EXPOSE 9000
