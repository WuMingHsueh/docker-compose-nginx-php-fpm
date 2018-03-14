#!/bin/bash
echo -e 'alias php="docker exec -it php php"' >> ~/.bashrc
echo -e 'alias phpunit="docker exec -it -u $(id -nu)  php phpunit"' >> ~/.bashrc
echo -e 'function composer() {
        if [[ $PWD =~ "public_root" ]];
        then
           docker exec -it -u $(id -nu) -w /var/www/public_root${PWD#/*public_root} php composer -d=./ $@
        else
           docker exec -it -u $(id -nu) php composer -d=./ $@
        fi
}' >> ~/.bashrc
echo -e 'function laravel() {
    if [[ $PWD =~ "public_root" ]];
    then
        docker exec -it -u $(id -nu) -w /var/www/public_root${PWD#/*public_root} php /home/$(id -nu)/.composer/vendor/bin/laravel $@
    else
        docker exec -it -u $(id -nu) php /home/$(id -nu)/.composer/vendor/bin/laravel $@
    fi
}' >> ~/.bashrc
echo -e 'function php-cs-fixer() {
    if [[ $PWD =~ "public_root" ]];
    then
        docker exec -it -u $(id -nu) -w /var/www/public_root${PWD#/*public_root} php /home/$(id -nu)/.composer/vendor/bin/php-cs-fixer $@
    else
        docker exec -it -u $(id -nu) php /home/$(id -nu)/.composer/vendor/bin/php-cs-fixer $@
    fi
}' >> ~/.bashrc
source ~/.bashrc
