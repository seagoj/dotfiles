sudo apt-get update
sudo apt-get -u upgrade
sudo apt-get install mysql-server mysql-client php5-mysql nginx php5 php5-fpm
sudo mkdir /var/www
sudo mkdir /var/www/nginx-default
sudo cp -r /usr/share/nginx/www/* /var/www/nginx-default/
sudo cp php.ini /etc/php5/fpm/php.ini
sudo service php5-fpm restart
sudo cp default /etc/nginx/sites-available/default
sudo service nginx restart

