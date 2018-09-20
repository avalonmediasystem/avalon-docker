FROM        jetty:alpine
LABEL       maintainer="Michael B. Klein <michael.klein@northwestern.edu>, Phuong Dinh <pdinh@indiana.edu>"
ARG         FEDORA_VERSION=4.7.5
ARG         FEDORA_DB_PASSWORD
ADD         --chown=jetty:jetty fcrepo-webapp-${FEDORA_VERSION}.war ${JETTY_BASE}/fedora/fedora.war
ADD         fedora.xml ${JETTY_BASE}/webapps/fedora.xml
RUN         mkdir ${JETTY_BASE}/data
VOLUME      ${JETTY_BASE}/data
EXPOSE      8080
