This Chef cookbook installs a development version of Vizzuality's CartoDB https://github.com/CartoDB/cartodb


**What is installed?**

* GDAL
* GEOS
* JSON
* Mapnik
* Nginx
* Node
* PgBouncer
* Postgis
* Postgres
* Proj
* Python
* Redis
* Ruby 1.9.2
 <br />  
 
Vizzuality Components:-

* CartoDB
* CartoDBSQL
* Windshaft

   <br />
   
**What OS does this work with?**

This cookbook has been tested on an Ubuntu 12.04 LTS EC2 instance.

   <br />
   
**What do I need to do?**

To run the cookbook you need to run setup.sh.

This will install ruby and the Chef Gem.

<br />

**What do I need to do after the install has finished**

After the install has finished you will need to run setup.sh.  This will set up your CartoDB domain.


<br />

**Note:**

This cookbook is designed to be used with <domain>.localdomain.com.  You will need to setup the address in your local machines host file in order for it to work, or adapt the script to use DNS.
