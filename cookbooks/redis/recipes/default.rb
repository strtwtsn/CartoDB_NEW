package "redis-server"

bash "Create Redis folder" do
code <<-EOH
mkdir /etc/redis
EOH
end

service "redis" do
  supports :restart => true, :start => true, :stop => true, :reload => true
  action :nothing
end 

template "/etc/redis/redis.conf" do
source "redis.conf.erb"
end


template "/etc/init.d/redis" do
source "redis.erb"
owner "root"
group "root"
mode "0755"
notifies :enable, "service[redis]"
notifies :start, "service[redis]"
end
