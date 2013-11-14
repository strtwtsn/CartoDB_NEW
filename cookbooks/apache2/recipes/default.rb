package "libcurl4-openssl-dev"
package "libssl-dev"
package "zlib1g-dev"
package "apache2-mpm-prefork"
package "apache2-prefork-dev"
package "libapr1-dev"
package "libaprutil1-dev"


bash "Install passenger components" do
code <<-EOH
gem install passenger
passenger-install-apache2-module --auto
EOH
end
