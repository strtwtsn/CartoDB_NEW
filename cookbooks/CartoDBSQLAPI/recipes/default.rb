bash "Do CartoDBSQL stuff" do
user "root"
code <<-EOH
git clone git://github.com/CartoDB/CartoDB-SQL-API.git /home/ubuntu/cartodb/CartoDB-SQL-API
cd /home/ubuntu/cartodb/CartoDB-SQL-API
git checkout master
npm install
EOH
end


service "cartodbsql" do
  service_name "cartodbsql"
  supports :restart => true, :status => true, :reload => true
end



template "/etc/init.d/cartodbsql" do
source "cartodbsql.erb"
mode 0755
notifies :restart, resources(:service => "cartodbsql"), :immediately
end

template "/home/ubuntu/cartodb/cartodb20/CartoDB-SQL-API/config/environments/production.js"
source "production.js.erb"
mode 0755
end
