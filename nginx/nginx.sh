#!/bin/sh

# Make config file from template
[ -z "$AVALON_DOMAIN" ] && AVALON_DOMAIN="http://avalon"
[ -z "$AVALON_STREAMING_PORT" ] && AVALON_STREAMING_PORT=80
[ -z "$AVALON_STREAMING_BUCKET_URL" ] && AVALON_STREAMING_BUCKET_URL="http://minio:9000/derivatives/"
export AVALON_DOMAIN
export AVALON_STREAMING_PORT
export AVALON_STREAMING_BUCKET_URL
envsubst '$AVALON_DOMAIN,$AVALON_STREAMING_PORT,$AVALON_STREAMING_BUCKET_URL' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec /usr/local/nginx/sbin/nginx
