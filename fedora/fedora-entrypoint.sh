#!/bin/sh

chown jetty:jetty /data
export JAVA_OPTIONS="${JAVA_OPTIONS} -Dfcrepo.modeshape.configuration=classpath:/config/jdbc-postgresql/repository.json"
export JAVA_OPTIONS="${JAVA_OPTIONS} -Dfcrepo.postgresql.username=fedora -Dfcrepo.postgresql.password=${FEDORA_DB_PASSWORD} -Dfcrepo.postgresql.host=db"
exec /docker-entrypoint.sh $@
