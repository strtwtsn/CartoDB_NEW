bash "Do Windshaft-cartodb stuff" do
user "root"
code <<-EOH
git clone git://github.com/CartoDB/Windshaft-cartodb.git /home/ubuntu/cartodb/Windshaft-cartodb
cd /home/ubuntu/cartodb/Windshaft-cartodb
git checkout master
npm install
EOH
end



service "windshaft" do
  service_name "windshaft"
  supports :restart => true, :status => true, :reload => true
end



template "/etc/init.d/windshaft" do
source "windshaft.erb"
mode 0755
notifies :restart, resources(:service => "windshaft"), :immediately
end

template "/home/ubuntu/cartodb/cartodb20/Windshaft-cartodb/config/environments/production.js
source "production.js.erb"
mode 0755
end





