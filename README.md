README

Costa Rica Kids

Stack

* Requires Microsoft Windows 8+

* Java
 * install Java 8 JDK from Oracle website http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

* jruby 9.0.3.0
 * install from http://jruby.org/download into C:\jruby-9.0.3.0

* SQL Server Express 2014
  * install from http://www.microsoft.com/en-ca/server-cloud/products/sql-server-editions/sql-server-express.aspx
  * use the SQL Server Express with Advanced Services package
  * install with mixed mode authentication
  * create a login crk_app_login with password "password"
  * create a user crk_app_user for said login
  * activate TCP to listen on port 1433
  * download the jdbc driver sqljdbc42.jar from https://msdn.microsoft.com/en-us/library/ms378526(v=sql.110).aspx
  * copy said sqljdbc42.jar to C:\jruby-9.0.3.0\sqljdbc42.jar

* git
 * git clone https://github.com/kpatrick/crk2 into c:\crk2

* rails
 * change directory to c:\crk2
 * run the command "jruby -S bundle install"
 * run the command "jruby -S rake db:create db:migrate db:seed"
 * run the command "jruby -S rails server"
 * open http://localhost:3000 to see a default Ruby on Rails page
 * additional flags and commands are need to run in production mode.
  * set the RAILS_ENV and SECRET_KEY_BASE system variables, run the assets compilations, setup production database, set the port
