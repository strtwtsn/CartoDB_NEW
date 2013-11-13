package "redis-server"

bash "Create Redis folder" do
code <<-EOH
mkdir /etc/redis
EOH
end


template "/etc/redis/redis.conf" do
source "redis.conf.erb"
end
