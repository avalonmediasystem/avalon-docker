#!/bin/sh

chown jetty:jetty /data
exec /docker-entrypoint.sh $@
