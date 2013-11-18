package "varnish"

service "varnish" do
  supports :restart => true, :start => true, :stop => true, :reload => true
  action :nothing
end 

template "/etc/varnish/default.vcl" do
source "default.vcl.erb"
owner "root"
group "root"
mode "0755"
notifies :enable, "service[varnish]"
notifies :start, "service[varnish]"
end
