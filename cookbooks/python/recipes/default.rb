package "python-setuptools"
package "python-dev"
package "libgdal1-dev"
 
bash "Do python stuff" do
user "root"
code <<-EOH
easy_install pip
pip install --no-install GDAL
python /tmp/pip_build_root/GDAL/setup.py build_ext --include-dirs=/usr/include/gdal/
pip install --no-download GDAL
pip install -r /home/ubuntu/cartodb/cartodb20/python_requirements.txt
pip install -e git+https://github.com/RealGeeks/python-varnish.git@0971d6024fbb2614350853a5e0f8736ba3fb1f0d#egg=python-varnish
EOH
end
