FROM        jetty:alpine
LABEL       maintainer="Michael B. Klein <michael.klein@northwestern.edu>, Phuong Dinh <pdinh@indiana.edu>"
ARG         FEDORA_VERSION=4.7.4
ARG         FEDORA_DB_PASSWORD
ADD         --chown=jetty:jetty fcrepo-webapp-${FEDORA_VERSION}.war ${JETTY_BASE}/fedora/fedora.war
ADD         fedora.xml ${JETTY_BASE}/webapps/fedora.xml
