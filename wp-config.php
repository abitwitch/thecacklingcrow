<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', 'nVeHb5%nUcmu2!K' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'WeW*-@N/fe2FT:atlUy4aV/[8$2>yVWPqkU54ds!CepR.*2hf6OT^@ynJ2!zQLyF' );
define( 'SECURE_AUTH_KEY',  'GE08}GQYXF?9LxzI1y]t#;gNybv#or,x){SQ&(@EzV$igh6 -OC,MVC8KF}E&z)7' );
define( 'LOGGED_IN_KEY',    'u#j.UMZWt7f%Jn+c3|/$Jb!y^IODQ5~8/]gF]8&xYtDg@uaSHjmJVo3B.%/_kPFT' );
define( 'NONCE_KEY',        'x)x?Ut^k`I5;W;.o;O0a!|}GS{4t=~!T{W?;G})D=3Cg%Wp:P[)jt(H|Q.CQHY^6' );
define( 'AUTH_SALT',        '<I*t^Js3$5)DZI`^,fTCL|) >!P ]|=BG4Al3^$4Le5vb<4,`$8DZg)j]1Ke#Y#(' );
define( 'SECURE_AUTH_SALT', 'zXxiYva,lm)%Q2q]Y^q<mqI)UZH0zL71^=$XVtTY1qELLGz(p`AfN2LUoElPfvPT' );
define( 'LOGGED_IN_SALT',   '{-onrYNrDlu%%ci4,QsslY4Qi,xg4b5x=?KtQ1*PgW#%t[9_D0ZEyG9B`of71M[.' );
define( 'NONCE_SALT',       '3/Sf=gUp({82u7KI8g[Uvt4`Zja?n9K#o_~`}Xq7<q]fw1w:}>s&WfQz[Ghm;>h5' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
