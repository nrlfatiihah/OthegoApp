FROM php:8.2-apache

# Install PHP extensions you need
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Optional: enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy your PHP project into the container
COPY src/ /var/www/html/

WORKDIR /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]