<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress_user' );

/** MySQL database password */
define( 'DB_PASSWORD', '123456' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 * 
 */
    define('AUTH_KEY',         '9s&0S`X`U+_,Bs2kfs+$1;H}0+O=,34XHMl0NJz]FP1gk _2/`Dv~8%C#tRSP#wY');
    define('SECURE_AUTH_KEY',  'kV1A,ymTjG+[GrfQt-/do93x3px^e-K}6)gX1`}.MU2a5zii-RMNg6fhu1>JkoRP');
    define('LOGGED_IN_KEY',    'fS3-$|8M^Yo)TOI_H>U5}-ml{W*L73I,M,-KQ+R4j,ODK nl+=X~WZqnW#R-SmO+');
    define('NONCE_KEY',        '|bf{v-e#pFVn9eZ-?b|,m&z)] Ea7-#r;+v,!n_u$PN*3-Qud-ltp~+X~V}3&7iw');
    define('AUTH_SALT',        'y+RMRTubJu(@|qr|]-~l)Pmix/:QstX`52wg|>/?!Xh|y+qf&}jD[h[{C^^2S9{y');
    define('SECURE_AUTH_SALT', 'F+,d03BfL>w|1y025y*xq$zxa|vX`OB<l?E9O2o_6m]ZOE},83+d#Mt)=~VbN[FA');
    define('LOGGED_IN_SALT',   '6ZLFdn4e7Hqj}rk>YM6l]^B-/-59^t|F.Zv8;d#ACy[Jq(*Pe9,g4#+p$^<o?M=M');
    define('NONCE_SALT',       '-PB%m~-,JgXk*,i*GgV;z[R%<JfQGDf-DT#m%>UgXXj18qf5_!LcSu0_&Ikj?{>k');

    $table_prefix = 'wp_';

    define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
    if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
    }

/** Sets up WordPress vars and included files. */
	require_once ABSPATH . 'wp-settings.php';
?>
