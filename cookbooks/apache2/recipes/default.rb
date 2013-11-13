bash "Install passenger components" do
# user "ubuntu"
code <<-EOH
sudo -u ubuntu rvm --default use ruby-1.9.2-p320@cartodb
sudo -u ubuntu gem install passenger
sudo -u ubuntu passenger-install-apache2-module --auto
EOH
end

