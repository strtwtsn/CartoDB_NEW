package "pgbouncer"

template "/etc/pgbouncer/pgbouncer.ini" do
source "pgbouncer.ini.erb"
end

template "/etc/pgbouncer/userlist.txt" do
source "userlist.txt.erb"
end

bash "Change port from 5432 to 6432" do
user "root"
code <<-EOH
sed -i 's/5432/6432/g' /home/ubuntu/cartodb20/config/database.yml
chmod -R 755 /etc/pgbouncer/pgbouncer.ini
chmod -R 755 /etc/pgbouncer/userlist.txt
mkdir -p /var/log/pgbouncer
touch /var/log/pgbouncer/pgbouncer.log
chown -R postgres:postgres /var/log/pgbouncer
chmod -R 777 /var/log/pgbouncer
EOH
end
