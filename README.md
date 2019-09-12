Wordpress fpm + nginx + mysql + letsencrypt SSL containers multisite configuration template

Following need to changed before executing "docker-compose up"

1. change root password in ./env/.mysql-env
2. Change individual site credentials in ./mysql-init.d/mysql-init.sql additional sites db can be configured here
3. Use credentials from #2 in corresponding site credentials in ./site1/.wp-env and ./site2/.wp-env and so on.
4. Change domains in ./docker-compose.yaml for certificate generation.
5. Change domain in ./nginx/conf.d/site1.conf "server_name"
6. Change domain in ./nginx/conf.d/site2.conf "server_name"

Run docker-compose up to start the containers and generate certificates (need to uncomment lines for "actual certificate" generation) 
once all is running except the certbots
Press ctrl+c to kill the command
Stop containers with docker-compose down

Now change following to use certificates generated

1. In ./nginx/conf.d/site1.conf, ssl_certificate and ssl_certificate_key use cert generated /etc/letsencrypt1/live/<domain name>/...
2. In ./nginx/conf.d/site2.conf, ssl_certificate and ssl_certificate_key use cert generated /etc/letsencrypt2/live/<domain name>/...

start containers with "docker-compose up -d"