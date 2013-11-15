service "resque" do
  service_name "resque"
  supports :restart => true, :status => true, :reload => true
end



template "/etc/init.d/resque" do
source "resque.erb"
mode "0755"
notifies :restart, resources(:service => "resque"), :immediately
end
