bash "Do Windshaft-cartodb stuff" do
user "root"
code <<-EOH
git clone git://github.com/CartoDB/Windshaft-cartodb.git /home/ubuntu/cartodb/Windshaft-cartodb
cd /home/ubuntu/cartodb/Windshaft-cartodb
git checkout master
npm install
EOH
end
