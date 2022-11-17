#!/bin/sh
set -xe

wp config create --path=/var/www/wordpress \
    --dbname="${DB_NAME}" \
	--dbuser="${DB_USER}" \
	--dbpass="${DB_PASS}" \
	--dbhost="mariadb" \
	--force \
	--extra-php << EOF
define('WP_REDIS_HOST', 'redis');
EOF

if ! wp core is-installed --path=/var/www/wordpress; then
	wp core install --path=/var/www/wordpress \
    --allow-root \
		--url="${WORDPRESS_SITE_NAME}" \
		--title="${WORDPRESS_SITE_TITLE}" \
		--admin_user="${DB_USER}" \
		--admin_password="${BD_PASS}" \
		--admin_email="${WORDPRESS_ADMIN_EMAIL}" \
		--skip-email
fi

if ! wp user get ${WORDPRESS_USER_NAME} --path=/var/www/wordpress; then
  wp user create --path=/var/www/wordpress ${WORDPRESS_USER_NAME} ${WORDPRESS_USER_EMAIL} --user_pass="${WORDPRESS_USER_PASSWORD}" --role=author --allow-root
fi

if ! wp plugin is-installed redis-cache --path=/var/www/wordpress; then
	wp plugin install redis-cache --path=/var/www/wordpress
  wp theme install inspiro --path=/var/www/wordpress --activate
fi

if ! wp plugin is-active redis-cache --path=/var/www/wordpress; then
	wp plugin activate redis-cache --path=/var/www/wordpress
fi

wp redis enable --path=/var/www/wordpress

exec "$@"
