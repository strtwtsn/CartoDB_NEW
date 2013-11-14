
#!/bin/bash
sudo apt-get -y update
sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev git libicu-dev build-essential
\curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 1.9.2
rvm use 1.9.2 --default
gem install chef -v 11.6.0 ruby-shadow --no-ri --no-rdoc
git clone --recursive https://github.com/CartoDB/cartodb20.git /home/ubuntu/cartodb/cartodb20
sudo add-apt-repository -y ppa:cartodb/gis
sudo add-apt-repository -y ppa:cartodb/nodejs
sudo add-apt-repository -y ppa:cartodb/redis
sudo add-apt-repository -y ppa:cartodb/postgresql
sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
sudo add-apt-repository -y ppa:mapnik/v2.1.0
sudo apt-get -y update
sudo git clone https://github.com/strtwtsn/CartoDB_NEW.git /var/chef/cartodb
rvmsudo chef-solo -c /var/chef/cartodb/config/chefsolo.rb -j /var/chef/cartodb/roles/cartodb.json
