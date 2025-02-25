# Use the official PHP 8.2 FPM (FastCGI Process Manager) image as the base image
FROM php:8.2-fpm

# Update the package lists for the APT package manager
RUN apt-get update

# Install necessary system dependencies
RUN apt-get install -y autoconf pkg-config libssl-dev libzip-dev git gcc make autoconf libc-dev vim unzip

# Install PHP extensions required for some applications
RUN docker-php-ext-install bcmath sockets zip

# Set the working directory inside the container to /app
WORKDIR /app

# Install Composer (PHP package manager) globally
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/composer /usr/bin/composer

# Start a built-in PHP server listening on port 8000
CMD php -S 0.0.0.0:8000
