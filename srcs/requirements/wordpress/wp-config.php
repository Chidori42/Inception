<?php
// ** MySQL settings from environment variables ** //
define( 'DB_NAME',     getenv('WORDPRESS_DB_NAME') );
define( 'DB_USER',     getenv('WORDPRESS_DB_USER') );
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );
define( 'DB_HOST',     getenv('WORDPRESS_DB_HOST') );

// Enable caching + Redis
define('WP_CACHE', true);
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);

// WordPress debugging mode (optional)
define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
