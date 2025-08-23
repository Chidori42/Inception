#!/bin/bash

# Variables to update:
DB_USER="your_db_user"
DB_HOST="localhost"
WP_URL="localhost"
WP_TITLE="My site"
WP_ADMIN_EMAIL="admin@example.com"

# Additional user info
NEW_USER="CHIDORI"
NEW_USER_PASS="4242"
NEW_USER_EMAIL="rcabdw@gmail.com"
NEW_USER_ROLE="subscriber" 

# Step 1: Create wp-config.php with existing DB info
wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --skip-check

# Step 2: Install WordPress
wp core install --url=$WP_URL --title="$WP_TITLE" --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=$WP_ADMIN_EMAIL

# Step 3: Add another user
wp user create $NEW_USER $NEW_USER_EMAIL --role=$NEW_USER_ROLE --user_pass=$NEW_USER_PASS

echo "WordPress setup complete!"
