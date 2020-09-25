#!/bin/sh

# Make config file from template
[ -z "$AVALON_DOMAIN" ] && AVALON_DOMAIN="http://avalon"
[ -z "$AVALON_STREAMING_PORT" ] && AVALON_STREAMING_PORT=80
export AVALON_DOMAIN
export AVALON_STREAMING_PORT
export AVALON_STREAMING_BASE_URL
envsubst '$AVALON_DOMAIN,$AVALON_STREAMING_PORT,$AVALON_STREAMING_BASE_URL' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec /usr/local/nginx/sbin/nginx
