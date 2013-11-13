#package "pgbouncer"

#service "pgbouncer" do
#  service_name "pgbouncer"
#  supports :restart => true, :status => true, :reload => true
#end


#template "/etc/pgbouncer/pgbouncer.ini" do
#source "pgbouncer.ini.erb"
#notifies :restart, resources(:service => "pgbouncer"), :immediately
#end

#template "/etc/pgbouncer/userlist.txt" do
#source "userlist.txt.erb"
#notifies :restart, resources(:service => "pgbouncer"), :immediately
#end

bash "Change port from 5432 to 6432" do
user "root"
code <<-EOH
sed -i 's/5432/6432/g' /home/ubuntu/cartodb20/config/database.yml
chmod -R 755 /etc/pgbouncer/pgbouncer.ini
chmod -R 755 /etc/pgbouncer/userlist.txt
EOH
end

