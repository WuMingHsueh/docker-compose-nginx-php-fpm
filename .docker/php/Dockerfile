FROM php:7.2.2-fpm
LABEL MAINTAINER="Wu Ming-hsueh ri3567@hotmail.com"

# install dependency package
RUN apt-get update && apt-get upgrade -y \
    apt-utils \
    g++ \
    libicu-dev \
    libpq-dev \
    zlib1g-dev \
    unixodbc-dev 

# install module use docker-php-ext-install
RUN docker-php-ext-install \
    intl \
    mbstring \
    mysqli \
    pdo_mysql \
    pgsql \
    pdo_pgsql \
    zip 

# install module use pear
RUN pecl install sqlsrv pdo_sqlsrv && docker-php-ext-enable sqlsrv pdo_sqlsrv
RUN pecl install mongodb redis xdebug && docker-php-ext-enable mongodb redis xdebug

# clean apt-get cache
RUN apt-get autoremove -y --purge && apt-get clean && rm -Rf /tmp/*


### install composer 
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv ./composer.phar /usr/local/bin/composer

### install phpunit 
RUN apt-get update && apt-get upgrade wget -y
RUN wget -O phpunit https://phar.phpunit.de/phpunit-7.phar
RUN chmod +x phpunit && mv phpunit /usr/local/bin/
RUN apt-get autoremove -y --purge && apt-get clean && rm -Rf /tmp/*

## please same with your id
ENV username ri3567  
### create user id in container
RUN apt-get update && apt-get upgrade sudo -y
RUN useradd -g www-data -m ${username}
RUN echo "${username} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${username} && chmod 0440 /etc/sudoers.d/${username}
RUN apt-get autoremove -y --purge && apt-get clean && rm -Rf /tmp/*

### install composer global package and add to bash Path
RUN sudo -u ${username} composer global require laravel/installer
RUN sudo -u ${username} composer global require FriendsOfPHP/PHP-CS-Fixer
RUN sudo -u ${username} echo "export PATH=/home/${username}/.composer/vendor/bin:${PATH}" >> /home/${username}/.bashrc
ENV PATH /root/.composer/vendor/bin:${PATH}
