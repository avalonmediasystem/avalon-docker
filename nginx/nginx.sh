#!/bin/sh

# Make config file from template
[ -z "$AUTH_URL" ] && AUTH_URL=http://avalon
[ -z "$AVALON_STREAMING_PORT" ] && AVALON_STREAMING_PORT=80
[ -z "$PROXY_PASS_URL" ] && PROXY_PASS_URL=http://s3-helper/
export AUTH_URL
export AVALON_STREAMING_PORT
export PROXY_PASS_URL
envsubst '$AUTH_URL,$AVALON_STREAMING_PORT,$PROXY_PASS_URL' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec /usr/local/nginx/sbin/nginx
