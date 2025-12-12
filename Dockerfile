# --- Stage 1: Builder (copy PHP source files cleanly) ---
FROM alpine:latest AS builder

WORKDIR /app

# Copy your PHP source code (Othego_mobile folder)
COPY Othego_mobile /app

# --- Stage 2: Final PHP-Apache Server ---
FROM php:8.2-apache

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache modules
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy built source from builder stage
COPY --from=builder /app .

# Expose Apache port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
