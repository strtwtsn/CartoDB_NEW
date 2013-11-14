#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev git checkinstall
cd /usr/local/src
sudo wget ftp://ftp.ruby-lang.org/pub/ruby/ruby-1.9.2-p320.tar.gz
sudo tar -xvzf ruby-1.9.2-p320.tar.gz
cd /usr/local/src/ruby-1.9.2-p320/
sudo ./configure
sudo make
sudo checkinstall --pkgname ruby_1.9.2 --pkgversion 1.0 --default
sudo gem install bundler  --no-ri --no-rdoc
sudo gem install chef -v 11.6.0 --no-ri --no-rdoc 
sudo gem install ruby-shadow --no-ri --no-rdoc
git clone --recursive https://github.com/CartoDB/cartodb20.git /home/ubuntu/cartodb/cartodb20
sudo add-apt-repository -y ppa:cartodb/gis
sudo add-apt-repository -y ppa:cartodb/nodejs
sudo add-apt-repository -y ppa:cartodb/redis
sudo add-apt-repository -y ppa:cartodb/postgresql
sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
sudo add-apt-repository -y ppa:mapnik/nightly-2.1
sudo apt-get -y update
sudo git clone https://github.com/strtwtsn/CartoDB_NEW.git /var/chef/cartodb
sudo chef-solo -c /var/chef/cartodb/config/chefsolo.rb -j /var/chef/cartodb/roles/cartodb.json
