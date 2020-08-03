rm /etc/nginx/nginx.conf
mv ./nginx.conf /etc/nginx/nginx.conf
mkdir /var/www/your_domain
chown -R $USER:$USER /var/www/your_domain
mv ./your_domain /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
rm /etc/nginx/sites-available/default
mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=RU/ST=Moscow/l=Moscow/O=21school/CN=hmiso"
service nginx start
service php7.3-fpm start
service mysql start
mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -e "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY '123456';"
mysql -e "FLUSH PRIVILEGES;"
mkdir /var/www/your_domain/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/your_domain/phpmyadmin
mv ./phpmyadmin.inc.php ./tmp/phpmyadmin.inc.php
cd /tmp
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
cp -a /tmp/wordpress/. /var/www/your_domain
chown -R www-data:www-data /var/www/your_domain
rm /var/www/your_domain/wp-config.php
cd
cd ..
mv ./wp-config.php ./var/www/your_domain/
service mysql reload
bash
