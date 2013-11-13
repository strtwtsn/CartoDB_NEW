#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install ruby1.9.1 rubygems ruby1.9.1-dev git
gem install chef ruby-shadow --no-ri --no-rdoc
git clone --recursive https://github.com/CartoDB/cartodb20.git /home/ubuntu/cartodb/cartodb20
sudo add-apt-repository -y ppa:cartodb/gis
sudo add-apt-repository -y ppa:cartodb/nodejs
sudo add-apt-repository -y ppa:cartodb/redis
sudo add-apt-repository -y ppa:cartodb/postgresql
sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
sudo add-apt-repository -y ppa:mapnik/v2.1.0
git clone https://github.com/strtwtsn/CartoDB_NEW.git /var/chef/cartodb

