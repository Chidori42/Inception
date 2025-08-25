#!/bin/bash

set -e
cd /var/www/wordpress
# Step 1: Create wp-config.php with existing DB info
wp core download --allow-root

wp config create \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=mariadb \
    --allow-root

# Step 2: Install WordPress
wp core install \
    --url=$WP_URL \
    --title="$WP_TITLE" \
    --admin_user=$MYSQL_USER \
    --admin_password=$MYSQL_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --allow-root

# Step 3: Add another user
wp user create $NEW_USER $NEW_USER_EMAIL --role=$NEW_USER_ROLE --user_pass=$NEW_USER_PASS --allow-root

echo "WordPress setup complete!"

exec php-fpm7.4 -F