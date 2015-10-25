README

Costa Rica Kids

Stack

* Microsoft Windows 8+

* SQL Server Express 2014
 * install from http://www.microsoft.com/en-ca/server-cloud/products/sql-server-editions/sql-server-express.aspx
 * use the SQL Server Express with Advanced Services package
 * install with mixed mode authentication
 * create a login crk_app_login with password "password"
 * create a user crk_app_user for said login
 * activate TCP to listen on port 1433
 * download the jdbc driver sqljdbc42.jar from https://msdn.microsoft.com/en-us/library/ms378526(v=sql.110).aspx

* jruby 9
 * install from http://jruby.org/download into C:\jruby-9.0.1.0
 * copy sqljdbc42.jar to C:\jruby-9.0.1.0\sqljdbc42.jar

* git
 * git clone https://github.com/kpatrick/crk2 into a local directory called crk2

* rails
 * run the command "jruby -S bundle install"
 * run the command "jruby -S rails server"
 * open http://localhost:3000 to see a default Ruby on Rails page

 
