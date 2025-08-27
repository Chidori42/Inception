#!/bin/bash

echo "starting"
cd /var/www/wordpress
sed -i 's/^listen\s*=.*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf
# # Step 0: Ensure WordPress files
wp core download --allow-root --force
mkdir -p /run/php
chown -R www-data:www-data /run/php

# Step 1: Create wp-config.php

#Clean up and rebuild
rm -f wp-config.php
wp config create \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=mariadb \
    --allow-root


if [[ "$WP_ADMIN_USER" == admin* || "$NEW_USER" == admin* ]]; then
    echo "ERROR: Username cannot start with admin."
else
    if [ -n "$NEW_USER" ] && [ -n "$NEW_USER_EMAIL" ] && \
       [ -n "$WP_ADMIN_PASS" ] && [ -n "$WP_ADMIN_EMAIL" ]; then
        # Step 2: Install WordPress
        wp core install \
            --url=$WP_URL \
            --title="$WP_TITLE" \
            --admin_user=$WP_ADMIN_USER \
            --admin_password=$WP_ADMIN_PASS \
            --admin_email=$WP_ADMIN_EMAIL \
            --allow-root

        # Step 3: Create additional user
        wp user create $NEW_USER $NEW_USER_EMAIL \
            --role=$NEW_USER_ROLE \
            --user_pass=$NEW_USER_PASS \
            --allow-root
    fi
fi


echo "🎉 WordPress setup complete!"

# Start PHP-FPM in foreground
exec php-fpm7.4 -F
