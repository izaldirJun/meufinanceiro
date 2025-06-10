# Base oficial do PHP 8.3 com FPM (FastCGI Process Manager)
FROM php:8.3-fpm

# Instala dependências necessárias para o Laravel e extensões do PHP
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    unzip \
    zip \
    && docker-php-ext-install pdo pdo_pgsql pgsql zip

# Instala o Composer (gerenciador de dependências do PHP)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Define diretório de trabalho dentro do container
WORKDIR /var/www/html

# Copia os arquivos do projeto para dentro do container
COPY . .

# Permite que o usuário do container (www-data) tenha acesso aos arquivos
RUN mkdir -p /var/www/html/storage /var/www/html/bootstrap/cache
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expõe a porta 9000 que o PHP-FPM usa
EXPOSE 9000

# Comando para rodar o PHP-FPM
CMD ["php-fpm"]
