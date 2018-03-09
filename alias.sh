echo "alias php='docker exec -it php php'" >> ~/.bashrc
echo "alias composer='docker exec -it -u $(id -nu) php composer'" >> ~/.bashrc
echo "alias phpunit='docker exec -it -u $(id -nu)  php phpunit'" >> ~/.bashrc
echo "alias laravel='docker exec -it -u $(id -nu) php /home/$(id -nu)/.composer/vendor/bin/laravel'" >> ~/.bashrc
echo "alias php-cs-fixer='docker exec -it -u $(id -nu) /var/$(id -nu)/.composer/vendor/bin/php-cs-fixer'" >> ~/.bashrc
source ~/.bashrc
