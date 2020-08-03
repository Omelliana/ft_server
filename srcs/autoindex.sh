if grep -q "autoindex off;" /etc/nginx/sites-available/your_domain
then sed -i 's/autoindex off;/autoindex on;/' /etc/nginx/sites-available/your_domain
else
sed -i 's/autoindex on;/autoindex off;/' /etc/nginx/sites-available/your_domain
fi
service nginx reload
