FROM        jetty:alpine
MAINTAINER  Michael B. Klein <michael.klein@northwestern.edu>
ARG         FEDORA_VERSION=4.5.1
ARG         FEDORA_DB_PASSWORD
ADD         https://github.com/fcrepo4/fcrepo4/releases/download/fcrepo-${FEDORA_VERSION}/fcrepo-webapp-${FEDORA_VERSION}.war ${JETTY_BASE}/fedora/fedora.war
#ADD         etc/ ${JETTY_BASE}/etc/
ADD         fedora.xml ${JETTY_BASE}/webapps/fedora.xml
RUN         /bin/chown -R jetty:jetty ${JETTY_BASE}/fedora/ 
#${JETTY_BASE}/etc/
#RUN         /bin/echo etc/jetty-fedorarealm.xml > ${JETTY_BASE}/start.ini
ADD         fedora-entrypoint.sh /
ENTRYPOINT  "/fedora-entrypoint.sh"
