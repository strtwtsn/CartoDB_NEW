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

bash "Update config file" do
user "root"
code <<-EOH
cd /home/ubuntu/cartodb/Windshaft-cartodb/config/environments/
wget https://raw.github.com/strtwtsn/CartoDB_NEW/Production/cookbooks/Windshaft/templates/default/production.js.erb
mv production.js.erb production.js
EOH
end

