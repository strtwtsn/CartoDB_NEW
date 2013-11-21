package "libcurl4-openssl-dev"
package "libssl-dev"
package "zlib1g-dev"
package "libapr1-dev"
package "libaprutil1-dev"


bash "Install passenger components" do
code <<-EOH
gem install passenger -v 4.0.24
passenger-install-nginx-module --auto
mkdir -p /opt/nginx/sites-available
mkdir -p /opt/nginx/sites-enabled
EOH
end

service "nginx" do
  service_name "nginx"
  supports :restart => true, :status => true, :reload => true
end



template "/etc/init.d/nginx" do
source "nginx.erb"
mode "0755"
notifies :restart, resources(:service => "nginx"), :immediately
end


template "/opt/nginx/conf/nginx.conf" do
source "nginx.conf.erb"
notifies :restart, resources(:service => "nginx"), :immediately
end



template "/opt/nginx/sites-available/cartodb-temp" do
source "cartodb.erb"
notifies :restart, resources(:service => "nginx"), :immediately
end




