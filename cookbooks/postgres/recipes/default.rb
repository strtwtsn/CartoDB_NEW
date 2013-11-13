package "postgresql-9.1" 
package "postgresql-client-9.1" 
package "postgresql-contrib-9.1" 
package "postgresql-server-dev-9.1"
package "postgresql-plpython-9.1"

service "postgresql" do
  service_name "postgresql"
  supports :restart => true, :status => true, :reload => true
end



template "/etc/postgresql/9.1/main/pg_hba.conf" do
source "pg_hba.conf.erb"
owner "postgres"
group "postgres"
notifies :restart, resources(:service => "postgresql"), :immediately
end



template "/etc/postgresql/9.1/main/postgresql.conf" do
source "postgresql.conf.erb"
owner "postgres"
group "postgres"
notifies :restart, resources(:service => "postgresql"), :immediately
end

