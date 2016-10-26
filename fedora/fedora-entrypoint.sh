#!/bin/sh

chown jetty:jetty /data
export JAVA_OPTIONS="${JAVA_OPTIONS} -Dfcrepo.home=/data"
exec /docker-entrypoint.sh $@
