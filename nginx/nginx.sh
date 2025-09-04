#!/bin/sh

# Make config file from template
[ -z "$AVALON_DOMAIN" ] && AVALON_DOMAIN="http://avalon"
[ -z "$AVALON_STREAMING_PORT" ] && AVALON_STREAMING_PORT=80
[ -z "$AVALON_STREAMING_BUCKET_URL" ] && AVALON_STREAMING_BUCKET_URL="http://minio:9000/derivatives/"
[ -z "$VOD_MODE" ] && VOD_MODE="local"
export AVALON_DOMAIN
export AVALON_STREAMING_PORT
export AVALON_STREAMING_BUCKET_URL
export VOD_MODE
envsubst '$AVALON_DOMAIN,$AVALON_STREAMING_PORT,$AVALON_STREAMING_BUCKET_URL,$VOD_MODE' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec /usr/local/nginx/sbin/nginx
