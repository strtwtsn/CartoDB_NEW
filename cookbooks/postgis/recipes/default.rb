package "checkinstall"

bash "Extract and install Postgis" do
user "root"
code <<-EOH
cd /tmp/
wget http://postgis.refractions.net/download/postgis-2.0.2.tar.gz
tar xvzf postgis-2.0.2.tar.gz
cd postgis-2.0.2
./configure --with-raster --with-topology
make
checkinstall --pkgname postgis --pkgversion 2.0.2-src --default
EOH
end

bash "configure postgis" do
user "root"
code <<-EOH
ldconfig

sudo -u postgres createdb -E UTF8 template_postgis
sudo -u postgres psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis'"
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/spatial_ref_sys.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/legacy.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/rtpostgis.sql
sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/topology.sql
sudo -u postgres psql -d template_postgis -c "GRANT ALL ON geometry_columns TO PUBLIC;"
sudo -u postgres psql -d template_postgis -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;"

EOH
end

