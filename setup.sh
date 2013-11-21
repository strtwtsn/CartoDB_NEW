#!/bin/bash
cd /home/ubuntu/cartodb/cartodb20
bundle --deployment
sudo redis-server /etc/redis/redis.conf
mv /home/ubuntu/cartodb/cartodb20/config/database.yml.sample  /home/ubuntu/cartodb/cartodb20/config/database.yml
echo "Please enter your Subdomain: "
read SUBDOMAIN
echo "Please enter your domain: "
read DOMAIN
echo "Please enter your Password: "
read PASSWORD
echo "Please enter your Admin Password: "
read ADMIN_PASSWORD
echo "Please enter your Email Addresss: "
read EMAIL
sudo RAILS_ENV=production bundle exec rake cartodb:db:setup SUBDOMAIN="${SUBDOMAIN}" PASSWORD="${PASSWORD}" ADMIN_PASSWORD="${ADMIN_PASSWORD}" EMAIL="${EMAIL}"
sudo RAILS_ENV=production bundle exec rake cartodb:db:setup SUBDOMAIN="${SUBDOMAIN}" PASSWORD="${PASSWORD}" ADMIN_PASSWORD="${ADMIN_PASSWORD}" EMAIL="${EMAIL}"
echo "127.0.0.1 ${SUBDOMAIN}.${DOMAIN}" | sudo tee -a /etc/hosts
sudo cp /home/ubuntu/cartodb/CartoDB-SQL-API/config/environments/production.js.example /home/ubuntu/cartodb/CartoDB-SQL-API/config/environments/production.js
sudo cp /home/ubuntu/cartodb/Windshaft-cartodb/config/environments/production.js.example /home/ubuntu/cartodb/Windshaft-cartodb/config/environments/production.js
SUBDOMAIN=${SUBDOMAIN}
cd /opt/nginx/sites-available
sudo mv cartodb-temp ${SUBDOMAIN}
sudo sed -i 's/SUBDOMAIN/${SUBDOMAIN}/g' /opt/nginx/sites-available/${SUBDOMAIN}
sudo sed -i 's/SUBDOMAIN/${SUBDOMAIN}/g' /etc/pgbouncer/userlist.txt
sudo sed -i 's/localhost.lan/${DOMAIN}/g' /home/ubuntu/cartodb/*
sudo ln -s /opt/nginx/sites-available/${SUBDOMAIN} /opt/nginx/sites-enabled/${SUBDOMAIN}
sudo service nginx restart

