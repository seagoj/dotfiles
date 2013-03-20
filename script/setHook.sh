sudo -u http mkdir /var/www/$1
cd /var/www/$1
sudo -u http git init
sudo -u http git pull -u git@github.com:seagoj/$1.git master
