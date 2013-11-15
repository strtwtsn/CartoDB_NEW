#!/bin/bash
cd /home/ubuntu/cartodb/cartodb20
sudo bundle install
sudo redis-server /etc/redis/redis.conf
echo "Please enter your Subdomain: "
read SUBDOMAIN
echo "Please enter your Password: "
read PASSWORD
echo "Please enter your Admin Password: "
read ADMIN_PASSWORD
echo "Please enter your Email Addresss: "
read EMAIL
sudo bundle exec rake cartodb:db:setup SUBDOMAIN="${SUBDOMAIN}" PASSWORD="${PASSWORD}" ADMIN_PASSWORD="${ADMIN_PASSWORD}" EMAIL="${EMAIL}"
sudo bundle exec rake cartodb:db:setup SUBDOMAIN="${SUBDOMAIN}" PASSWORD="${PASSWORD}" ADMIN_PASSWORD="${ADMIN_PASSWORD}" EMAIL="${EMAIL}"
echo "127.0.0.1 ${SUBDOMAIN}.localhost.lan" | sudo tee -a /etc/hosts
sudo cp /home/ubuntu/cartodb/CartoDB-SQL-API/config/environments/development.js.example /home/ubuntu/cartodb/CartoDB-SQL-API/config/environments/development.js
sudo cp /home/ubuntu/cartodb/Windshaft-cartodb/config/environments/development.js.example /home/ubuntu/cartodb/Windshaft-cartodb/config/environments/development.js
cd /etc/apache2/sites-available
mv cartodb-temp ${SUBDOMAIN}
sed -i 's/SUBDOMAIN/${SUBDOMAIN}/g' /etc/apache2/sites-available/${SUBDOMAIN}
sudo a2ensite ${SUBDOMAIN}
sudo service windshaft start
sudo service cartodb start
sudo service resque start
