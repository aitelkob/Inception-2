#!/bin/sh
set -xe

wp config create --path=/var/www/wordpress \
    --dbname="wordpress" \
	--dbuser="wpuser" \
	--dbpass="wppass" \
	--dbhost="mariadb" \
	--force \
	--extra-php << EOF
define('WP_REDIS_HOST', 'redis');
EOF

if ! wp core is-installed --path=/var/www/wordpress; then
	wp core install --path=/var/www/wordpress \
		--url="${WORDPRESS_SITE_NAME}" \
		--title="${WORDPRESS_SITE_TITLE}" \
		--admin_user="${WORDPRESS_ADMIN_NAME}" \
		--admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
		--admin_email="${WORDPRESS_ADMIN_EMAIL}" \
		--skip-email
fi

#if ! wp user get ${WORDPRESS_USER_NAME} --path=/var/www/wordpress; then
#	wp user create --path=/var/www/wordpress \
#       		${WORDPRESS_USER_NAME} ${WORDPRESS_USER_EMAIL}\
#		--role=${WORDPRESS_USER_ROLE} \
#		--user_pass=${WORDPRESS_USER_PASSWORD}
#fi

if ! wp plugin is-installed redis-cache --path=/var/www/wordpress; then
	wp plugin install redis-cache --path=/var/www/wordpress
fi

if ! wp plugin is-active redis-cache --path=/var/www/wordpress; then
	wp plugin activate redis-cache --path=/var/www/wordpress
fi

wp redis enable --path=/var/www/wordpress

exec "$@"
