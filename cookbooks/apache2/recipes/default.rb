package "libcurl4-openssl-dev"
package "libssl-dev"
package "zlib1g-dev"
package "apache2-mpm-prefork"
package "apache2-prefork-dev"
package "libapr1-dev"
package "libaprutil1-dev"


bash "Install passenger components" do
code <<-EOH
gem install passenger -v 4.0.24
passenger-install-apache2-module --auto
sudo sh -c "echo 'LoadModule passenger_module /usr/local/lib/ruby/gems/1.9.1/gems/passenger-4.0.24/buildout/apache2/mod_passenger.so' >> /etc/apache2/apache2.conf"
sudo sh -c "echo 'PassengerRoot /usr/local/lib/ruby/gems/1.9.1/gems/passenger-4.0.24' >> /etc/apache2/apache2.conf"
sudo sh -c "echo 'PassengerDefaultRuby /usr/local/bin/ruby' >> /etc/apache2/apache2.conf"
EOH
end


service "apache2" do
  service_name "apache2"
  supports :restart => true, :status => true, :reload => true
end



template "/etc/apache2/sites-available/cartodb-temp" do
source "cartodb.erb"
notifies :restart, resources(:service => "apache2"), :immediately
end
