#!/bin/bash

# Step 1: Create wp-config.php with existing DB info
wp config create \
    --dbname=$WORDPRESS_DB_NAME \
    --dbuser=$WORDPRESS_DB_USER \
    --dbpass=$WORDPRESS_DB_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --skip-check

wp core download --path=/var/www/html --allow-root
# Step 2: Install WordPress
wp core install \
    --url=$WP_URL \
    --title="$WP_TITLE" \
    --admin_user=$MYSQL_USER \
    --admin_password=$MYSQL_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --path=/var/www/html \
    --allow-root

# Step 3: Add another user
wp user create $NEW_USER $NEW_USER_EMAIL --role=$NEW_USER_ROLE --user_pass=$NEW_USER_PASS

echo "<?php
/** Loads the WordPress Environment and Template */
require( dirname( __FILE__ ) . '/wp-blog-header.php' );
" > /var/www/html/index.php

echo "WordPress setup complete!"
