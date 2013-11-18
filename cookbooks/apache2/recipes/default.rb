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
