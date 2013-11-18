package "libcurl4-openssl-dev"
package "libssl-dev"
package "zlib1g-dev"
package "libapr1-dev"
package "libaprutil1-dev"


bash "Install passenger components" do
code <<-EOH
gem install passenger -v 4.0.24
passenger-install-nginx-module --auto
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
