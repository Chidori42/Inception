#!/bin/bash


cd /var/www/wordpress

# Step 0: Ensure WordPress files
wp core download --allow-root --force

# Step 1: Create wp-config.php
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
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASS \
    --admin_email=$WP_ADMIN_EMAIL \
    --allow-root

# Step 3: Create additional user if variables exist
if [ -n "$NEW_USER" ] && [ -n "$NEW_USER_EMAIL" ]; then
    wp user create $NEW_USER $NEW_USER_EMAIL --role=${NEW_USER_ROLE:-subscriber} --user_pass=${NEW_USER_PASS:-password} --allow-root
fi

echo "🎉 WordPress setup complete!"

# Start PHP-FPM in foreground
exec php7.4-fpm -F
