# Dockerizing SugarCRM

This repository builds a dockerized architecture for SugarCRM in order to help SugarCRM developers and administrators to develop and customize their SugarCRM instance. It assumes that you have a licence for SugarCRM version 8 

## Architecture

Three different architectures are presented below, the Simple Architecture used mainly on development, the Extended and Cluster Architecture which provide a more real life scenario 

### Simple Architecture

The following services are included:
* Web server. An Apache web server running PHP 
* Scheduler. A service running PHP and cron used for SugarCRM scheduler
* Database. MySQL database
* Search. Elasticsearch used for searching
* Database migration tool. Flyway database migration tool used for database migrations
* Permissions. Sets the files permissions on startup


### Extended Architecture
The following services are included:
* Load Balancer. HAProxy 
* Web servers. 2 Apache web servers running PHP 
* Scheduler. A service running PHP and cron used for SugarCRM scheduler
* Database. MySQL database
* Search. Elasticsearch used for searching
* Database migration tool. Flyway database migration tool used for database migrations 
* Permissions. Sets the files permissions on startup
* Session storage. Redis database used for storing the sessions

### Cluster Architecture
TBD

## How to set up a development environment

* Clone the repository `git clone https://github.com/dimosthe/sugar-docker.git` and `cd sugar-docker`
* Add your SugarCRM's source code under `data/sugar/sugarcrm`
* Add your certificate under `docker-images/app/config/apache2/certificates`. You can create your own Self-Signed Certificate with OpenSSL e.g. `openssl req  -newkey rsa:2048 -nodes -keyout sugar.docker.com.key -x509 -days 365 -out sugar.docker.com.crt`
* It assumes that the database migrations are stored under `data/sugar/sugarcrm/sql`
* Run `docker-compose -f docker-compose-dev.yml up` (for the Simple Architecture) or `docker-compose -f docker-compose-extended-dev.yml up` (for the Extended Architecture)
* You need to import your database schema on the first time. You can run `docker exec -i sugar-db sh -c 'exec mysql -uroot -p"root"' < /some/path/on/your/host/sugarcrm_schema.sql`. Also you need to create a database user and grant permissions e.g. `CREATE USER 'sugarcrmuser'@'%' IDENTIFIED BY '12345678'; GRANT ALL PRIVILEGES ON sugarcrmdb. * TO `sugarcrmuser`@`%`;`. 
* Make sure to modify `data/sugar/sugarcrm/config.php`, `data/sugar/sugarcrm/config_override.php` and `dbmigration/config/flyway.conf` with the corresponding Mysql and Elasticsearch settings.
* Point to https://localhost to access the application